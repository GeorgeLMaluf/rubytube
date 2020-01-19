class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

    before_action :configure_devise_params, if: :devise_controller?

    protected
    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:nome, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :email, :password, :password_confirmation])
    end
end
