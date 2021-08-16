module Api
  module V1
    module Auth
      class SessionsController < ApplicationController
        skip_before_action :authenticated, only: %i[create]

        def create
          user = User.find_by(email: params[:user][:email])

          if user&.authenticate(params[:user][:password])
            session[:user_id] = user.id
            render json: {
              status: :created,
              logged_in: true,
              user: user
            }
          else
            render json: {
              status: 401
            }
          end
        end

        def logged_in
          if current_user
            render json: {
              logged_in: true,
              user: @current_user
            }
          else
            render json: {
              logged_in: false
            }
          end
        end

        def logout
          reset_session
          render json: {
            status: 200,
            logged_out: true
          }
        end

        private

        def session_params
          params.require(:user).permit(:email, :password)
        end
      end
    end
  end
end
