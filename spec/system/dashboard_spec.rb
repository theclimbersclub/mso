require "rails_helper"
RSpec.describe "Dashboard", type: :system, js: true do
  context "authenticated user" do
    before do
      user = create(:user)
      user.confirm
      sign_in user
      get dashboard_index_path
    end

    it "displays the login history" do
      expect(response.body).to have_content("Dashboard")
    end

    it "displays the login history" do
      expect(response.body).to have_content("Login History")
      expect(response.body).to have_content(Date.today.strftime("%Y/%m/%d"))
      expect(response.body).to have_content("Success")
    end
  end

  context "guest user" do
    before do
      get dashboard_index_path
    end

    it "redirects to sign in" do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
