require 'spec_helper'

describe Admin::CommentsController do
  let(:comments) { [Factory.stub(:comment)] }

  describe "GET index" do
    it "can assing comments as @comments" do
      CommentPresenter.should_receive(:comments).with(:review => 'visible').and_return comments

      get :index, :review => 'visible'

      controller.should assign_to(:comments).with(comments)
    end
  end
end