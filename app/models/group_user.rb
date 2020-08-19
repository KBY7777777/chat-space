class GroupUser < ApplicationRecord

  #応用カリNo91にて、中間テーブルとして、usersとgroupsとに対するrelationを設定
  belongs_to :group
  belongs_to :user

end
