class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|

      #応用カリNo91にて、「name」カラムを、String型で、入力必須、重複NG、index設定で追加
      t.string :name, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
