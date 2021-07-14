class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery_charge, :delivery_day,
             :item_status, :prefecture
end
