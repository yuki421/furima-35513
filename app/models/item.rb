class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to:300, less_than_or_equal_to:9999999 }

    with_options numericality: { other_than: 0} do
      validates :category_id
      validates :item_status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    
  end
end
