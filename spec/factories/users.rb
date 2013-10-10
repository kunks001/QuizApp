# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name     "Alex Peattie"
    email    "alex@makersacademy.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
