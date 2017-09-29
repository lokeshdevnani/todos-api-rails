FactoryGirl.define do
  factory :user do
    name { Faker::Name.neme }
    email 'foo@bar.com'
    password 'foobar'
  end
end
