class ApplicationController < ActionController::Base

  include SessionsHelper
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image]) 
  end
end
