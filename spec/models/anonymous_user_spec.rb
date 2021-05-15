require "rails_helper"

RSpec.describe AnonymousUser, type: :model do
  it { expect(described_class.new.super_admin).to eq(false) }
end
