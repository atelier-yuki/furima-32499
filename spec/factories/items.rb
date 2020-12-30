FactoryBot.define do
  factory :item do

    item_name              { "great T-shirt" }
    discription            { "すばらしいTシャツです！" }
    category_id            { 1 }
    item_state_id          { 1 }
    delivery_charge_id     { 1 }
    address_id             { 1 }
    delivery_day_id        { 1 }
    price                  { 10000 }

    after(:build) do |item|
      item.image.attach(io: File.open('./app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

    association :user
  end
end
