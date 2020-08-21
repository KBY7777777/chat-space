class Message < ApplicationRecord

  #応用カリNo92にて、messageデータに対してgroupとuserとのrelationを設定する
  #（group-messageは1vs多、user-messageも1vs多）
  belongs_to :group
  belongs_to :user

  #同時に、messageデータについて、contentカラムは入力必須とするvalid制約を追加
  validates :content, presence: true, unless: :image?

  #さらに、imageデータについて、uploaderの設定を追記
  mount_uploader :image, ImageUploader

end
