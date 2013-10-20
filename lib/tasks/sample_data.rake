namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Srikanth",
                 email: "srikanth@example.com",
                 password: "foobar12",
                 password_confirmation: "foobar12")
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.org"
      password  = "password"
      user = User.create!(name: name,
                          email: email,
                          password: password,
                          password_confirmation: password)
      10.times do |n|
        Quiz.create!( user: user,
                      title: "Quiz-#{n}")
      end
    end
  end
end