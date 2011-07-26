FactoryGirl.define do
  sequence(:name) { |n| "Name #{n}" }

  factory :page do
    name
    content 'Page content'
  end
end