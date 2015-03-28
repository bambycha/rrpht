class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :pic
      t.integer :user_id
      t.string :title

      t.timestamps null: false
    end
    add_index :photos, :title
  end
end
