FactoryGirl.define do
  factory :user do
    first_name 'Phillip'
    last_name 'Kazanjian'
    sequence(:email) { |n| "test#{n}#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
  end
end
