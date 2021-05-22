require "rails_helper"
describe ApplicationController do
  controller do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  before do
    @user = create(:user)
    @user.confirm
  end

  describe "After sigin-in" do
    it "redirects to the /dashboard page" do
      expect(controller.after_sign_in_path_for(@user)).to eq(dashboard_index_path)
    end
  end
end
