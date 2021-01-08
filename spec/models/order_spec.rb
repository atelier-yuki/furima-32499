require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe "商品購入画面" do
    context '商品の購入ができるとき' do
      it "post_num,address_id,city,block,building,tell,が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
end
