class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.integer :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_deleted, default: false, null: false

      t.timestamps
    end
  end
end
