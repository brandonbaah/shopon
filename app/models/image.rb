class Image < ActiveRecord::Base
  belongs_to :products

  validates :link, presence: true
end
