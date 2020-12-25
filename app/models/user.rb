class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true

  valid_password_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, 
            format: { with: valid_password_regex,
            message: "は半角英数字それぞれ１文字以上含む必要があります" }
  validates :password_confirmation, presence: true
  validates :birthday, presence: true

  valid_username_regex = /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/.freeze
  with_options presence: true, format: { with: valid_username_regex, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :last_name
  end

  valid_username_kana_regex = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true, format: { with: valid_username_kana_regex, message: 'に全角カタカナ文字を使用してください' } do
    validates :fname_kana 
    validates :lname_kana 
  end 
end
