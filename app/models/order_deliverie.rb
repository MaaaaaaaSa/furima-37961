class OrderDeliverie
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :citys, :address, :building_name, :phone, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyden(-)"}
    validates :citys
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Deliverie.create(postal_code: postal_code, prefecture_id: prefecture_id, citys: citys, address: address, building_name: building_name, phone: phone, order_id: order.id)
  end
end