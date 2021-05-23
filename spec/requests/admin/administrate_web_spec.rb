require "rails_helper"
RSpec.describe "Sidekiq Web" do
  it "isnt available to guests" do
    get sidekiq_web_path
    expect(response).to redirect_to("/users/sign_in")
  end

  it "isnt available to users" do
    user = create(:user)
    user.confirm
    sign_in user
    expect { get sidekiq_web_path }.to raise_error(ActionController::RoutingError)
  end

  it "is available to admin" do
    admin = create(:admin)
    admin.confirm
    sign_in admin
    get sidekiq_web_path
    expect(response).to have_http_status(:success)
  end
end
