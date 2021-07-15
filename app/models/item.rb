class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id, :item_status_id, :delivery_charge_id,
                         :prefecture_id, :delivery_day_id

  belongs_to :user
  has_one_attached :image
  
  with_options :presence true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price、format: { with: /\A[a-z0-9]+\z/i}, { in: 300..99999999 }
  end
end
