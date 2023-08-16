class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    # logic to add
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || expenses_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
