class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :photo

  default_scope { where(tenant_id: Tenant.current_id)}
end
