FactoryBot.define do
  factory :user do
    sequence :uid { Faker::Number.number(10)}
    sequence :username { Faker::Name.name }
  end
end
