class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :furigana_family_name, presence: true
  validates :furigana_first_name, presence: true
  validates :birthdate, presence: true

  has_many :items
  has_many :purchases
end
