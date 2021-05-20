class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable
  devise :pwned_password unless Rails.env.test?

  has_many :login_activities, as: :user
end
