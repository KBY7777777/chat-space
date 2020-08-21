class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #応用カリNo90の実演にて、「name」カラムの追加に伴うvalidationを設定
  validates :name, presence: true, uniqueness: true

  #応用カリNo91にて、groupsテーブルの追加に伴うassociationを設定
  has_many :group_users
  has_many :groups, through: :group_users

  #応用カリNo92にて、messageテーブルに対して1vs多のrelationを設定
  has_many :messages
  
end
