#応用カリNo98にて、modelテストのテストコード作成

#Fakerでテストデータを生成させる
FactoryBot.define do
  factory :group do
    name {Faker::Team.name}
  end
end
