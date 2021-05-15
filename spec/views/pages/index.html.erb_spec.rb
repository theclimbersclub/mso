# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pages/index.html.erb", type: :view do
  context "when not signed in" do
    it "displays the welcome" do
      render

      expect(rendered).to match(/Welcome Guest/)
    end
  end

  context "when signed in" do
    let(:user) { create(:user) }

    before do
      user.confirm
      sign_in user
    end

    it "displays the user" do
      render
      expect(rendered).to match(/Welcome User/)
    end
  end
end
