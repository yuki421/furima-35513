class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_status, :delivery_charge,
             :prefecture, :delivery_day
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price, format: { with: /\A[a-z0-9]+\z/i }, numericality: { in: 300..99999999 }
  end
end
