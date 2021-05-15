require "rails_helper"

RSpec.describe User, type: :model do
    describe '#email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value("blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
      it { should have_db_index(:email) }
    end

    describe "#password" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(8).on(:update) }
      it { should validate_length_of(:password).is_at_least(8).on(:create) }
    end

    describe '#super_admin' do
      it { should have_db_column(:super_admin) }
    end
end
