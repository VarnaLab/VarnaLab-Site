FactoryGirl.define do
  sequence(:unique_name) { |n| "Name #{n}" }

  factory :page do
    name { FactoryGirl.generate(:unique_name) }
    content 'Page content'
  end

  factory :comment do
    association :commentable, :factory => :page
    commenter_name  'John Doe'
    commenter_email 'john.doe@example.com'
    body 'Comment by visitor'
  end

  factory :visitor_comment, :parent => :comment do
    # TODO
  end
  

end