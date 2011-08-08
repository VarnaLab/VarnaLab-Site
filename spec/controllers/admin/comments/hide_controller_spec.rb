require 'spec_helper'

describe Admin::Comments::HideController do
  let(:comment) { Factory.stub(:comment) }

  before { Comment.stub :find => comment }

  describe "POST 'create'" do
    before { comment.stub :hide! }

    it "hides the comment" do
      comment.should_receive(:hide!)

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
    before { comment.stub :show! }

    it "shows the comment" do
      comment.should_receive(:show!)

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
