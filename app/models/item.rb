class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :discription, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 0 }
    validates :item_state_id, numericality: { other_than: 0 }
    validates :delivery_charge_id, numericality: { other_than: 0 }
    validates :address_id, numericality: { other_than: 0 }
    validates :delivery_day_id, numericality: { other_than: 0 }

    valid_price_regex = /\A(?=.*?[\d])[\d]+\z/i.freeze
    validates :price,
              format: { with: valid_price_regex },
              numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :address
  belongs_to_active_hash :delivery_day
end