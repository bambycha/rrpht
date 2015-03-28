class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :photos

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
