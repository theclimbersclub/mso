require "rails_helper"
RSpec.describe "Sessions" do
  it "signs user in and out" do
    user = create(:user)
    user.confirm
    sign_in user
    get root_path
    expect(response).to render_template(:index)
    expect(controller.current_user).to eq(user)
    expect(controller.user_signed_in?).to eq(true)

    sign_out user
    get root_path
    expect(response).to render_template(:index)
    expect(controller.current_user).to be_a(AnonymousUser)
    expect(controller.user_signed_in?).to eq(false)
  end

  it "displays Log in to guest" do
    get root_path
    expect(response.body).to include("Log in")
  end

  it "displays Log out to user" do
    user = create(:user)
    user.confirm
    sign_in user
    get root_path
    expect(response.body).to include("Log out")
  end

  it "use devise default current user in a devise controller" do
    get new_user_session_path
    expect(controller.current_user).to eq(nil)
  end
end
