class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.integer :category_id
      t.string :product_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
