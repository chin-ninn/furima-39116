class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :family_name,         presence: true
  validates :first_name,          presence: true
  validates :family_name_reading, presence: true
  validates :first_name_reading,  presence: true
  validates :birth,               presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password include both letters and numbers in password'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'Use double-byte characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: 'Use double-byte kana' } do
    validates :family_name_reading
    validates :first_name_reading
  end

  has_many :items
  has_many :purchases
end