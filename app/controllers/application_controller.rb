class ApplicationController < ActionController::Base

  include SessionsHelper
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image]) 
  end

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end
