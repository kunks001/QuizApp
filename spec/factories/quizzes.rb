FactoryGirl.define do
	factory :quiz do
		sequence(:title){ |n| "Quiz#{n}" }
		questions { [ create(:question) ] }
	end

  factory :question do
    sequence(:query){ |n| "WHY?" }
    answers { [ create(:correct_answer), 3.times.map{ create(:wrong_answer) } ].flatten }
  end

  factory :correct_answer, :class => Answer do
    sequence(:response){ |n| "for the #{n}th time! NO idea" }
    correctness true
  end

  factory :wrong_answer, :class => Answer do
    sequence(:response){ |n| "for the #{n}th time! SOME idea" }
    correctness false
  end
end
