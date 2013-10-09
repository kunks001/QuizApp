FactoryGirl.define do
  factory :quiz do
    sequence(:title)  { |n| "Quiz #{n}" }
  end
end