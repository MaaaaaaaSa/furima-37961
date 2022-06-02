class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_time

  validates :image, presence: true
  validates :item_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :product_description, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, with: /[0-9]/ }
  validates :category_id, :item_condition_id, :postage_id, :prefecture_id, :shipping_time_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
