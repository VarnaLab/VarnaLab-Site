require 'spec_helper'

module Admin
  describe CommentsPresenter do
    it "can give the selected review" do
      CommentsPresenter.new.review.should == 'unreviewed'
      CommentsPresenter.new(:review => 'visible').review.should == 'visible'
      CommentsPresenter.new(:review => 'hidden').review.should == 'hidden'
    end

    describe "finding comments" do
      it "shows unreviewed comments by default" do
        reviewed_comment = Factory(:comment, :reviewed => true)
        unreviewed_comment = Factory(:comment, :reviewed => false)

        CommentsPresenter.new.comments.should == [unreviewed_comment]
      end

      it "can select visible or hidden comments" do
        visible_comment = Factory(:comment, :hidden => false)
        hidden_comment = Factory(:comment, :hidden => true)

        CommentsPresenter.new(:review => 'visible').comments.should == [visible_comment]
        CommentsPresenter.new(:review => 'hidden').comments.should == [hidden_comment]
      end

      it "can show only comments for given commentable" do
        comment_1 = Factory(:comment)
        comment_2 = Factory(:comment)

        CommentsPresenter.new(:commentable => comment_1.commentable).comments.should == [comment_1]
        CommentsPresenter.new(:commentable => comment_2.commentable).comments.should == [comment_2]
      end
    end
  end
end