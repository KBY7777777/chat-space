#応用カリNo98にて、modelテストのテストコード作成

#Fakerでテストデータを生成させる
FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    group
  end
end
