FactoryBot.define do
  factory :order do

    token {"tok_abcdefghijk00000000000000000"}
    card_cvc { 123 }
    post_num {"123-4567"}
    address_id { 1 }
    city {}
    block {}
    building {}
    tell {"09011112222"}
    user_id { 1 }
    item_id { 9 }

 
  end
end
