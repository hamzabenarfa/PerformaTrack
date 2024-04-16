FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      username { Faker::Internet.username } 
      password { 'testpassword123' }
      password_confirmation { 'testpassword123' }
    end
  end
  