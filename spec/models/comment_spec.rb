require 'spec_helper'

describe Comment do
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:commentable) }
  it { should validate_presence_of(:commenter_name) }
  it { should validate_presence_of(:commenter_email) }
  it { should validate_presence_of(:body) }
  it { should_not allow_mass_assignment_of(:hidden) }

  it "can list hidden or visible comments" do
    visible_comment = Factory(:comment, :hidden => false)
    hidden_comment = Factory(:comment, :hidden => true)

    Comment.hidden.should == [hidden_comment]
    Comment.visible.should == [visible_comment]
  end

  it "can give all unreviewed comments" do
    reviewed_comment = Factory(:comment, :reviewed => true)
    unreviewed_comment = Factory(:comment, :reviewed => false)

    Comment.unreviewed.should == [unreviewed_comment]
  end

  describe "(reviewing)" do
    let(:comment) { Factory(:comment) }

    subject { comment }

    describe "hiding" do
      before { comment.review_with! false }

      it { should be_hidden }
      it { should be_reviewed }
    end

    describe "showing/approving" do
      before { comment.review_with! true }

      it { should_not be_hidden }
      it { should be_reviewed }
    end
  end
end
