class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
       added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
       devise_parameter_sanitizer.permit :sign_up
       devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
