class Order
  include ActiveModel::Model
  attr_accessor :post_num, :address_id, :city, :block, :building, :tell, :user_id, :item_id

  with_options presence: true do
    validates :address_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :user_id
    validates :item_id

    valid_tell_regex = /\A[0-9]{1,11}\z/.freeze
    validates :tell,
              format: { with: valid_tell_regex }

    valid_post_regex = /\A\d{3}[-]\d{4}\z/.freeze
    validates :post_num,
               format: { with: valid_post_regex }

  end
  
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      DeliveryDestination.create(post_num: post_num, address_id: address_id, city: city, block: block, building: building, tell: tell, purchase_id: purchase.id)
    end
end
