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
    comment.hide!
    comment.should be_hidden
  end

  it "can be shown" do
    comment = Factory(:comment, :hidden => true)
    comment.show!
    comment.should_not be_hidden
  end

  it "can list hidden or visible comments" do
    visible_comment = Factory(:comment, :hidden => false)
    hidden_comment = Factory(:comment, :hidden => true)

    Comment.hidden.should == [hidden_comment]
    Comment.visible.should == [visible_comment]
  end
end
