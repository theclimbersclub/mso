FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    password { "12345678" }
    super_admin { false }
  end

  factory :admin, class: "User" do
    email { generate(:email) }
    password { "12345678" }
    super_admin { true }
  end
end
