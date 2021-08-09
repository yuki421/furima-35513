class OrderAddress
  include ActiveModel::Model
  attr_accessor :city, :street_number, :building, :prefecture_id, :postal_code, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :city
    validates :street_number 
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone, format: {with: /\A0\d{9,10}\z/ }
  end

  validates :prefecture_id, numericality: {other_than: 0}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(city: city, street_number: street_number, building: building, prefecture_id: prefecture_id, postal_code: postal_code, phone: phone, order_id: order.id)
  end
end