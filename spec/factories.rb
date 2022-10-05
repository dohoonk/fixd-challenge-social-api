FactoryBot.define do
    factory :github_event do
        association :user, factory: :user
        event_type { Faker::Lorem.sentence }
        event_id { "123" }
        repo_name { Faker::Name.name }
        event_created_at { "2022-10-05 12:32:17" }
        status { "MyString" }
        size { 4 }
        number { 5 }
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
        github_username { 'dohoonk' }
    end
end