# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    if devise_controller?
      @current_user = super
    else
      @current_user ||= super || AnonymousUser.new
    end
  end

  def user_signed_in?
    current_user.is_a? User
  end

  def after_sign_in_path_for(resource)
    set_flash_message! :alert, :warn_pwned if resource.respond_to?(:pwned?) && resource.pwned?
    super
  end
end
