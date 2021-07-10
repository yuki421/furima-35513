class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }, 
                                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday,           presence: true
end
