FactoryBot.define do
    factory :post do
        title { Faker::Lorem.sentence }
        body { Faker::Lorem.paragraph }
      end

    factory :user do
        email { Faker::Internet.email }
        password { 'chester' }
        password_confirmation { 'chester' }
    end
end