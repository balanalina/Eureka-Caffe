class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :category
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
