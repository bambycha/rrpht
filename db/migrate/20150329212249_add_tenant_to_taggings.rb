class AddTenantToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :tenant_id, :integer
    add_index :taggings, :tenant_id
  end
end
