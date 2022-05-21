class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/i}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/}
  validates :last_name_furigana, presence: true, format: { with: /\A[ァ-ンー]+\z/}
  validates :first_name_furigana, presence: true, format: { with: /\A[ァ-ンー]+\z/}
  validates :birth_date, presence: true
end
