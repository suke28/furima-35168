require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it '全ての値が正しい場合は登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含む必要があること' do
        @user.email = 'hoge.hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは6文字以上が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordは半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordは全角英数字混合では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'furigana_family_nameが必須であること' do
        @user.furigana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana family name can't be blank")
      end
      it 'furigana_first_nameが必須であること' do
        @user.furigana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank",
                                                      'Furigana first name is invalid. Input full-width katakana characters.')
      end
      it 'family_nameは全角入力が必須であること' do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it 'first_nameは全角入力が必須であること' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'furigana_family_nameは全角カタカナ入力が必須であること' do
        @user.furigana_family_name = 'ﾔﾏﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana family name is invalid. Input full-width katakana characters.')
      end
      it 'furigana_first_nameは全角カタカナ入力が必須であること' do
        @user.furigana_first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana first name is invalid. Input full-width katakana characters.')
      end
      it 'birthdateが必須であること' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end
