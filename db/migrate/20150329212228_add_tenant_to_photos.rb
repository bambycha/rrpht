class AddTenantToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :tenant_id, :integer
    add_index :photos, :tenant_id
  end
end
