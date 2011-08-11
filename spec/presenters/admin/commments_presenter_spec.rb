require 'spec_helper'

module Admin
  describe CommentsPresenter do
    describe "finding comments" do
      it "shows unreviewed comments by default" do
        reviewed_comment = Factory(:comment, :reviewed => true)
        unreviewed_comment = Factory(:comment, :reviewed => false)

        CommentsPresenter.find_comments.should == [unreviewed_comment]
      end

      it "can select visible or hidden comments" do
        visible_comment = Factory(:comment, :hidden => false)
        hidden_comment = Factory(:comment, :hidden => true)

        CommentsPresenter.find_comments(:review => 'visible').should == [visible_comment]
        CommentsPresenter.find_comments(:review => 'hidden').should == [hidden_comment]
      end
    end
  end
end