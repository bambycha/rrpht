class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :photos

  default_scope { where(tenant_id: Tenant.current_id) if Tenant.current_id}

  validates :password, length: { minimum: 6 }, on: :create
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create

  validates_uniqueness_of :email, scope: :tenant_id
end
