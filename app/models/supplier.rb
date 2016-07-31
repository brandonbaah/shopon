class Supplier < ActiveRecord::Base
  has_many :products
  # def products
  #   Product.where(supplier_id: id)
  # end
end
