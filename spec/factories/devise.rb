FactoryBot.define do
  factory :user do
    id {1}
    first_name {"George"}
    last_name {"Costanza"}
    email {"george@abc.com"}
    password {"pointer"}
  end
end