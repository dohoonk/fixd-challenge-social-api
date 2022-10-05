FactoryBot.define do
  factory :github_event do
    event_type { "MyString" }
    event_id { "MyString" }
    repo_name { "MyString" }
    event_created_at { "2022-10-05 12:32:17" }
    status { "MyString" }
    size { 1 }
    number { 1 }
    user_id { nil }
  end

    factory :rating do
        association :user, factory: :user
        association :rater, factory: :user
        rating { 4.0 }
    end

    factory :comment do
        association :user, factory: :user
        association :post, factory: :post
        message { Faker::Lorem.sentence }
    end

    factory :post do
        association :user, factory: :user
        title { Faker::Lorem.sentence }
        body { Faker::Lorem.paragraph }
      end

    factory :user do
        email { Faker::Internet.email }
        password { 'chester' }
        password_confirmation { 'chester' }
    end
end