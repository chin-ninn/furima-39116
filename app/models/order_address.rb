class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :area_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :city,presence: true
  validates :house_number,presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'use single-byte number' }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, length: { minimum: 10 }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
      building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
