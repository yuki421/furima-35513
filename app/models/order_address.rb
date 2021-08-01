class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building, :phone, :user_id, :item_id
  
  with_options presence: true do
    validates :city
    validates :street_number 
    validates :building
    validates :prefecture_id, numericality: {other_than: 0}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone, format: {with: /\A[0-9]\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(city: city, street_number: street_number, building: building, prefecture_id: prefecture_id, postal_code: postal_code, phone: phone, order_id: order_id)
  end
end