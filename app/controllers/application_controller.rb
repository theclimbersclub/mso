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

  def login_history
    current_user.login_activities
  end

  protected

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

end
