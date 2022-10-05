FactoryBot.define do
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