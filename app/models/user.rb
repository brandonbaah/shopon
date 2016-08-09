class User < ActiveRecord::Base
   has_secure_password
   has_many :orders
   has_many :carted_products
   has_many :products, through: :carted_products

   validates :email, presence: true
   validates :email, uniqueness: true
   validates :name, presence: true
   validates :password, length: {minimum: 8}

end
