class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area, :city, :house_number, :building_name, :phone_number, :price, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number
    validates :price
    validates :user_id
  end

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(
      postal_code: postal_code, area: area, city: city, house_number: house_number,
      building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
