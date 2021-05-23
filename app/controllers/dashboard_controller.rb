class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @payload = { login_history: login_history }
  end
end
