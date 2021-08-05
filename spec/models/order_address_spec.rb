require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '保存できるとき' do
      it '全て埋まっていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物は空でも保存できる' do
        @order_address.building = '' 
        expect(@order_address).to be_valid
      end

      it '電話番号は10桁であれば保存できる' do
        @order_address.phone = '0312345678' 
        expect(@order_address).to be_valid
      end

      it '電話番号は11桁であれば保存できる' do
        @order_address.phone = '09012345678' 
        expect(@order_address).to be_valid
      end
    end
    
    context '保存できないとき' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it '郵便番号に「-」がないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号の「-」が正しい位置でないと保存できない' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空だと保存できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end

      it '市区町村が空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end

      it '電話番号が10桁または11桁の数字でなければ保存できない' do
        @order_address.phone = '0901234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'ユーザー情報がない場合は保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

    end
  end
end
