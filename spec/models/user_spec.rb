require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる時' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、family_name_reading、first_name_reading、birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが6文字未満だと登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password include both letters and numbers in password'
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password include both letters and numbers in password'
      end

      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'family_nameに半角英字、全角英字、半角カタカナが含まれると登録できない' do
        @user.family_name = 'ｙあmaﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name use double-byte characters'
      end

      it 'first_nameに半角英字、全角英字、半角カタカナが含まれると登録できない' do
        @user.first_name = 'ｔあroｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name use double-byte characters'
      end

      it 'family_name_readingが空だと登録できない' do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name reading can't be blank"
      end

      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading can't be blank"
      end

      it 'family_name_readingに全角漢字、全角ひらがな、半角カタカナが含まれると登録できない' do
        @user.family_name_reading = 'やﾏ田'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name reading use double-byte kana'
      end

      it 'first_name_readingに全角漢字、全角ひらがな、半角カタカナが含まれると登録できない' do
        @user.first_name_reading = '太ろｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading use double-byte kana'
      end

      it 'birthが空だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
    end
  end
end
