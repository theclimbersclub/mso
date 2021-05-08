# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pages/index.html.erb", type: :view do
  context "when not signed in" do
    it "displays the welcome" do
      render

      expect(rendered).to match(/Sign up/)
    end
  end
end
