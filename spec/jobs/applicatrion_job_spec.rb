require "rails_helper"

RSpec.describe ApplicationJob, type: :mailer do
  describe "defaults" do
    let(:job) { ApplicationJob.new }

    it "can be instantiated" do
      expect(job).to be_a ApplicationJob
    end
  end
end
