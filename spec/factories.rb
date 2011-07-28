FactoryGirl.define do
  sequence(:unique_name) { |n| "Name #{n}" }

  factory :page do
    name { Factory.next(:unique_name) }
    content 'Page content'
  end
end