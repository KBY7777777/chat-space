class CreateGroupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_users do |t|

      #応用カリNo91にて、「group」テーブルの外部キーと「user」テーブルの外部キーを設定を追記
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
