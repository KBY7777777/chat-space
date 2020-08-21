class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|

      #応用カリNo92にて、model生成と併せて、「content」カラムと「image」カラムをString型にて宣言
      #+「group」と「user」を外部キーとする定義を追記
      t.string :content
      t.string :image
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
