require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  describe "defaults" do
    let(:mail) { ApplicationMailer.new }

    it "renders the defaults" do
      expect(mail.default_params[:from]).to eq("from@example.com")
      expect(mail.action_has_layout?).to eq(true)
    end
  end
end
