class ApplicationController < ActionController::Base
  # devise setting
  before_action :authenticate_user!, except: [:home, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  # flash message types
  add_flash_types :success, :info

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end
