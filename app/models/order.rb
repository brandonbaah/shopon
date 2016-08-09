class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :subtotal, :tax, :total, presence: true
  validates :subtotal, :tax, :total, numericality: true

end
