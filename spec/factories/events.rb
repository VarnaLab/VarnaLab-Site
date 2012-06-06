# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    body "MyText"
    author nil
    date "2012-06-06 22:20:39"
    place "MyString"
  end
end
