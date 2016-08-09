class CategoryProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :category

  validates :quantity, presence: true 
  validates :quantity, numericality: true
end
