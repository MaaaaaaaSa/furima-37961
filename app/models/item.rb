class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_time
  belongs_to :user
  has_one_attached :image

  validates :image, :item_name, :product_description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /[0-9]/ }
  validates :category_id, :item_condition_id, :postage_id, :prefecture_id, :shipping_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
