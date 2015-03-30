class AddTenantToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tenant_id, :integer
    add_index :tags, :tenant_id
  end
end
