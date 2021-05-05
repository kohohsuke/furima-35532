class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :family_name_kana, format: { with: /\A[ア-ヶー]+\z/, message: 'Full-width katakana characters.' }
    validates :first_name_kana, format: { with: /\A[ア-ヶー]+\z/, message: 'Full-width katakana characters.' }
    validates :birthday
  end
end
