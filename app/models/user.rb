class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #応用カリNo90の実演にて、「name」カラムの追加に伴うvalidationを設定
  validates :name, presence: true, uniqueness: true

end
