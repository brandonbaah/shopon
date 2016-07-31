class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.text :name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
