# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@makersacademy.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end
