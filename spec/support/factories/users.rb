FactoryBot.define do
  factory :user do
    uid "24700836"
    username "marshallhouston"
    token ENV['github_access_token']
    picture "https://avatars1.githubusercontent.com/u/24700836?v=4"
  end
end
