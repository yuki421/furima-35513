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
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to:300, less_than_or_equal_to:99999999 }
  end
end
