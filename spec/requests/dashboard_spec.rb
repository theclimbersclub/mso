require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  context "Authenticated User" do
  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      user.confirm
      sign_in user
      get dashboard_index_path
      expect(response).to have_http_status(:success)
    end
  end
end

context "Guest User" do
  describe "GET /index" do
    it "returns http redirect" do
      get dashboard_index_path
      expect(response).to have_http_status(:redirect)
    end
  end
end

end
