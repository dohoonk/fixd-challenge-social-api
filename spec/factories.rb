FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { 'chester' }
        password_confirmation { 'chester' }
    end
end