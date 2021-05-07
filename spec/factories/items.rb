FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 5) }
    description      { Faker::Lorem.sentences(number: 1) }
    category_id      { 1 }
    status_id        { 1 }
    shipping_free_id { 1 }
    prefecture_id    { 1 }
    schedule_id      { 1 }
    price            { Faker::Number.number(digits: 7) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
