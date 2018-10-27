FactoryBot.define do

  sequence (:email) { |n| "test#{n}@test.de" }

  factory :user do
    email
    password 'password'
    first_name 'Test'
    last_name 'User'
    admin false
  end

  factory :admin, class: User do
    email
    password 'password'
    first_name 'Test'
    last_name 'Admin'
    admin true
  end

end
