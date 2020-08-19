class Group < ApplicationRecord

  #応用カリNo91にて、テーブル間のassociationとvalidationの設定を追記
  #group_usersテーブルに対して1vs多のrelationを設定
  has_many :group_users
  #group_usersテーブルを介して、usersテーブルに対して1vs多のrelationを設定
  has_many :users, through: :group_users

  #nameカラムについて、入力必須、重複NGの制約を設定
  validates :name, presence: true, uniqueness: true

end
