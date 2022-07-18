class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :sale_status
      t.string :image_tag
      
      t.timestamps
    end
  end
end
