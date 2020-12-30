require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品画面" do
    context '商品の出品ができるとき' do
      it "image,item_name,discription,category_id,item_state_id,delivery_charge_id,address_id,delivery_day_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "discriptionが空では登録できない" do
        @item.discription = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it "category_idが#{0}では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "item_state_idが#{0}では登録できない" do
        @item.item_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 0")
      end
      it "delivery_charge_idが#{0}では登録できない" do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it "address_idが#{0}では登録できない" do
        @item.address_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Address must be other than 0")
      end
      it "delivery_day_idが#{0}では登録できない" do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "item_state_idが空では登録できない" do
        @item.item_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank", "Item state is not a number")
      end
      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge is not a number")
      end
      it "address_idが空では登録できない" do
        @item.address_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank", "Address is not a number")
      end
      it "delivery_day_idが空では登録できない" do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300未満では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が、¥9,999,999超過では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角英字では登録できない" do
        @item.price = "hoge"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end