class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_num, :address_id, :city, :block, :building, :tell

  with_options presence: true do
    validates :post_num
    validates :address_id
    validates :city
    validates :block
    validates :tell
  end
  
    def save
      purchase = Purchase.cteate(user_id: User.id, item_id: Item.id)
      DeliveryDestination.create(post_num: post_num, address_id: address_id, city: city, block: block, building: building, tell: tell, purchase_id: purchase.id)
    end
end
