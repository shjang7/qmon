class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :devise_parameter_sanitizer, if: :devise_controller?

  protected

  def devise_parameter_sanitizer
    if resource_class == Merchandiser
      Merchandiser::ParameterSanitizer.new(Merchandiser, :merchandiser, params)
    elsif resource_class == Customer
      Customer::ParameterSanitizer.new(Customer, :customer, params)
    else
      super
    end
  end
end
