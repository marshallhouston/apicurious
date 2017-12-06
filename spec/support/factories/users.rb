FactoryBot.define do
  factory :user do
    sequence :uid { Faker::Number.number(10)}
    sequence :username { |n| "Username#{n}"  }
  end
end
