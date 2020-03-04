class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit({ roles: [] }, :email, :password, :username, :business_name, :owner_name, :contact, :business_number, :company_address)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit({ roles: [] }, :email, :password, :current_password, :username, :business_name, :owner_name, :contact, :business_number, :company_address)
    end
  end
end
