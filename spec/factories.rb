FactoryGirl.define do
  factory :user do
    name "John"
    email "a@goop.com"
    password "app"
    password_confirmation { User.generate_password_confirmation }
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end