require 'spec_helper'

describe Comment do
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:commentable) }
  it { should validate_presence_of(:commenter_name) }
  it { should validate_presence_of(:commenter_email) }
  it { should validate_presence_of(:body) }
  it { should_not allow_mass_assignment_of(:hidden) }

  it "can be hidden" do
    comment = Factory(:comment)
    comment.should_not be_hidden
    comment.hide!
    comment.should be_hidden
  end
end
