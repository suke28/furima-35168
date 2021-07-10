class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Password Include both letters and numbers' }
    validates :nickname
    validates :family_name
    validates :first_name
    validates :furigana_family_name
    validates :furigana_first_name
    validates :birthdate
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :family_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :furigana_family_name
    validates :furigana_first_name
  end
end
