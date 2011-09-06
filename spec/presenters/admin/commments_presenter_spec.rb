require 'spec_helper'

module Admin
  describe CommentsPresenter do
    describe "title" do
      it "is the review when no commentable is given" do
        CommentsPresenter.new.title.should == 'All comments'
        CommentsPresenter.new(:review => 'visible').title.should == 'Visible comments'
      end

      it "is the commentable name + review when commentable is given" do
        commentable = double(:name => 'Commentable')

        CommentsPresenter.new(:commentable => commentable).title.should == 'All comments for Commentable'
        CommentsPresenter.new(:commentable => commentable, :review => 'unreviewed').title.should == 'Unreviewed comments for Commentable'
        CommentsPresenter.new(:commentable => commentable, :review => 'visible').title.should == 'Visible comments for Commentable'
      end
    end

    describe "finding comments" do
      it "shows all comments by default" do
        reviewed_comment = Factory(:comment, :reviewed => true)
        unreviewed_comment = Factory(:comment, :reviewed => false)

        comments = CommentsPresenter.new.comments
        comments.should include(reviewed_comment)
        comments.should include(unreviewed_comment)
      end

      it "can select unreviewed comments" do
        reviewed_comment = Factory(:comment, :reviewed => true)
        unreviewed_comment = Factory(:comment, :reviewed => false)

        CommentsPresenter.new(:review => 'unreviewed').comments.should == [unreviewed_comment]
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