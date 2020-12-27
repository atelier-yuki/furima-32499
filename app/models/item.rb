class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :discription, length: { maximum: 1000 }
    validates :category_id
    validates :item_state_id
    validates :delivery_charge_id
    validates :address_id
    validates :delivery_day_id
    validates :price, length: { in: 300..9999999 }
  end
end
