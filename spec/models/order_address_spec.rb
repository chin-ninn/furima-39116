require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'areaを選択していないと保存できないこと' do
        @order_address.area_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが全角数値では保存できないこと' do
        @order_address.phone_number = "１１１１１１１１１１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number use single-byte number"
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_address.phone_number = "111111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_address.phone_number = "111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
