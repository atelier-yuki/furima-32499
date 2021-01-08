FactoryBot.define do
  factory :order do

    token { "tok_abcdefghijk00000000000000000" }
    post_num { "123-4567" }
    address_id { 1 }
    city { "神戸市" }
    block { "青山1-1-1" }
    building { "土ビル" }
    tell { "09011112222" }
    user_id { 1 }
    item_id { 9 }

 
  end
end
