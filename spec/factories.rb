FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    user { nil }
  end

    factory :user do
        email { Faker::Internet.email }
        password { 'chester' }
        password_confirmation { 'chester' }
    end
end