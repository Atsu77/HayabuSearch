module Api
  module V1
    module Auth
      class RegistrationsController < ApplicationController
        skip_before_action :authenticated, only: %i[create]

        def create
          user = User.create!(sign_up_params)

          if user
            session[:user_id] = user.id
            render json: {
              status: :create,
              user: user
            }
          else
            render json: {
              status: 500
            }
          end
        end

        def update
          user = User.find(params[:id])
          if user.update(account_update_params)
            render json: {
              status: :create,
              user: user
            }
          else
            render json: {
              status: 500
            }
          end
        end

        private

        def sign_up_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

        def account_update_params
          params.require(:user).permit(:name, :email)
        end
      end
    end
  end
end
