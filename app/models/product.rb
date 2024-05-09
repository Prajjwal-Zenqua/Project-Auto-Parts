class Product < ApplicationRecord
  # has_one_attached :productimage
  # has_many_attached :images
  # has_one_attached :image
  has_many :product_images
  has_many_attached :images
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :part_number, uniqueness: true
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
