require 'spec_helper'

describe Admin::Comments::ReviewsController do
  let(:comment) { Factory.stub(:comment) }

  before do
    Comment.stub :find => comment
    comment.stub :review_with!
  end

  describe "POST 'create'" do
    it "hides the comment" do
      comment.should_receive(:review_with!).with true

      put :create, :comment_id => '1'
    end

    it "sets the flash" do
      put :create, :comment_id => '1'

      controller.should set_the_flash
    end

    it "redirects to comments list" do
      put :create, :comment_id => '1'

      response.should redirect_to(admin_comments_path)
    end
  end

  describe "DELETE 'destroy'" do
    it "shows the comment" do
      comment.should_receive(:review_with!).with false

      delete :destroy, :comment_id => '1'
    end

    it "sets the flash" do
      delete :destroy, :comment_id => '1'

      controller.should set_the_flash
    end

    it "redirects to comments list" do
      delete :destroy, :comment_id => '1'

      response.should redirect_to(admin_comments_path)
    end
  end
end
