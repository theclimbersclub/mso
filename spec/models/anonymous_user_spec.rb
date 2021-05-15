require "rails_helper"

RSpec.describe AnonymousUser, type: :model do
  it { expect(AnonymousUser.new.super_admin).to eq(false) }
end
