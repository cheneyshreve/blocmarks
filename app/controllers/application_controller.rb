class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end

end
