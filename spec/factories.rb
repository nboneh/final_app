FactoryGirl.define do
  factory :user do
    first_name  "first"
    last_name 	"last"
    email    "test@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end