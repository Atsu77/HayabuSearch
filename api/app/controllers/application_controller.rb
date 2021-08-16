class ApplicationController < ActionController::API
  include ActionController::Helpers

  before_action :authenticated
  helper_method :logged_in?, :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticated
    return if logged_in?
  end
end
