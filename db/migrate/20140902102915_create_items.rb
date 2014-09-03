class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :category_id

      t.timestamps
    end
    add_index :items, :category_id
  end
end
