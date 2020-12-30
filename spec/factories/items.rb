FactoryBot.define do
  factory :item do

    item_name              { Faker::Lorem.sentence( 1,40 ) }
    discription                 { Faker::Lorem.sentences( 1,1000) }
    category_id              { "レディース" }
    item_state_id { "新品、未使用" }
    delivery_charge_id           { "着払い(購入者負担)" }
    address_id             { "北海道" }
    delivery_day_id            { "1~2日で発送" }
    price            { 10000 }

    after(:build) do |item|
      item.image.attach(io: File.open('FURIMA-32499/app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

    association :user
  end
end
