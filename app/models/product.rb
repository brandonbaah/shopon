class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products

  def sales_message
    if price.to_i < 2
      return "Discount Item!"
    else
      return "Not on Sale!"
  end
  end

  def tax
    0.09 * price.to_i
  end

def total
  tax + price.to_i
end

end
