require "rails_helper"
RSpec.describe "Adminstrate Web" do
  it "isnt available to guests" do
    get admin_root_path
    expect(response).to redirect_to("/users/sign_in")
  end

  it "isnt available to an ordinary user" do
    user = create(:user)
    user.confirm
    sign_in user
    get admin_root_path
    expect(response).to redirect_to("/")
  end

  it "is available to a super admin user" do
    admin = create(:admin)
    admin.confirm
    sign_in admin
    get admin_root_path
    expect(response).to have_http_status(:success)
  end
end
