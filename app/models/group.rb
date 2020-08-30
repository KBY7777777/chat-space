class Group < ApplicationRecord

  #応用カリNo91にて、テーブル間のassociationとvalidationの設定を追記
  #group_usersテーブルに対して1vs多のrelationを設定
  has_many :group_users
  #group_usersテーブルを介して、usersテーブルに対して1vs多のrelationを設定
  has_many :users, through: :group_users

  #応用カリNo92にて、messageテーブルに対して1vs多のrelationを設定
  has_many :messages

  #nameカラムについて、入力必須、重複NGの制約を設定
  validates :name, presence: true, uniqueness: true

  #応用カリNo97にて、テストコード実施時に無用の警告文の表示を回避できる記述（なくてもよい）
  validates :name, presence: true, uniqueness: {case_sensitive: true}

  #応用カリNo92、side-bar__contentに最新メッセージを表示する設定の実装にて、
  #最新メッセージを探索・判別するメソッドを新設
  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end
