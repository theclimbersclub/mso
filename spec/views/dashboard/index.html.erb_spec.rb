require 'rails_helper'

RSpec.describe "dashboard/index.html.erb", type: :view do
  context "when signed in" do
    let(:user) { create(:user) }

    before do
      assign(:payload, { login_history: [] })
      user.confirm
      sign_in user
    end

    it "displays the user" do
      render
      expect(rendered).to match(/Dashboard/)
      expect(rendered).to match(/Login History/)
    end
  end
end
