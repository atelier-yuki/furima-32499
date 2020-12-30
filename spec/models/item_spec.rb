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
        binding.pry
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まない場合登録できない" do
        @user.email = "asdfghkl"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "test123"
        @user.password_confirmation = "test456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = 1111111
        @user.password_confirmation = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが全角では登録できない" do
        @user.password = "１１１１１１"
        @user.password_confirmation = "１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name に全角文字を使用してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name に全角文字を使用してください")
      end
      it "family_nameが半角では登録できない" do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name に全角文字を使用してください")
      end
      it "last_nameが半角では登録できない" do
          @user.last_name = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
      end
      it "fname_kanaが空では登録できない" do
        @user.fname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana can't be blank", "Fname kana に全角カタカナ文字を使用してください")
      end
      it "lname_kanaが空では登録できない" do
        @user.lname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana can't be blank", "Lname kana に全角カタカナ文字を使用してください")
      end
      it "fname_kanaがかな文字では登録できない" do
        @user.fname_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana に全角カタカナ文字を使用してください")
      end
      it "lname_kanaがかな文字では登録できない" do
        @user.lname_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana に全角カタカナ文字を使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end