require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @buyer.id, item_id: @item.id)
  end

  describe "商品購入画面" do
    context '商品の購入ができるとき' do
      it "token,post_num,address_id,city,block,tell,が存在すれば登録できる" do
        expect(@order).to be_valid
      end

      it "buildingが存在しなくても登録できる" do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "post_numが空では登録できない" do
        @order.post_num = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post num can't be blank")
      end

      it "post_numがハイフンなしでは登録できない" do
        @order.post_num = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post num is invalid")
      end

      it "address_idが空では登録できない" do
        @order.address_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "address_idが#{0}では登録できない" do
        @order.address_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Address must be other than 0")
      end

      it "cityが空では登録できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "blockが空では登録できない" do
        @order.block = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it "tellが空では登録できない" do
        @order.tell = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell can't be blank")
      end

      it "tellがハイフン有りでは登録できない" do
        @order.tell = "090-1111-2222"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell is invalid")
      end

      it "tellが全角では登録できない" do
        @order.tell = "０９０１１１１２２２２"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell is invalid")
      end

      it "tellが半角英字では登録できない" do
        @order.tell = "abcabcdabcd"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell is invalid")
      end

      it "tellが12文字以上では登録できない" do
        @order.tell = "090111122223"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell is invalid")
      end

      it "user_idが空では登録できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
