require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'image、item_name、item_text、category_id、condition_id、charge_id、area_id、scheduled_day_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_textが空だと出品できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item text can't be blank"
      end

      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'category_idで1を選択すると出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'condition_idで1を選択すると出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'charge_idが空だと出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end

      it 'charge_idで1を選択すると出品できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end

      it 'area_idが空だと出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end

      it 'area_idで1を選択すると出品できない' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end

      it 'scheduled_day_idが空だと出品できない' do
        @item.scheduled_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled day can't be blank"
      end

      it 'scheduled_day_idで1を選択すると出品できない' do
        @item.scheduled_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled day can't be blank"
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceに半角数字以外が含まれていると出品できない' do
        @item.price = '２00'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price use single-byte number'
      end

      it 'priceが300以下だと出品できない' do
        binding.pry
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299 and must be less than 10000000'
      end

      it 'priceが9999999以上だと出品できない' do
        @item.price = '20000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299 and must be less than 10000000'
      end

      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
