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
end
