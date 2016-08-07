class RemoveIntegerFromCategory < ActiveRecord::Migration
  def change
    remove_column :category_products, :integer, :string
  end
end
