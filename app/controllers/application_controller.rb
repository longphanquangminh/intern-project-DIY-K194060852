class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
   
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :configure_sign_up_params, if: :devise_controller?
   
    protected
   
    def configure_permitted_parameters
      added_attrs = [:username, :email, :full_name, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  end
  