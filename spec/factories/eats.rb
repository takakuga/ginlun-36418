FactoryBot.define do
  factory :eat do
    association :user 
      title {Faker::Lorem.sentence}
      shop_name {Faker::Lorem.sentence}
      category {Faker::Lorem.sentence}
      price {Faker::Lorem.sentence}
      detail {Faker::Lorem.sentence}
      
    after(:build) do |eat|
      eat.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
