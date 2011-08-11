require 'spec_helper'

describe Admin::CommentsController do
  let(:comments) { [Factory.stub(:comment)] }

  describe "GET index" do
    it "can assing unreviewed comments as @comments" do
      Comment.should_receive(:unreviewed).and_return comments

      get :index

      controller.should assign_to(:comments).with(comments)
    end

    it "can assign visible comments as @comments" do
      Comment.should_receive(:visible).and_return comments

      get :index, :review => 'visible'

      controller.should assign_to(:comments).with(comments)
    end

    it "can assings hidden comments as @comments" do
      Comment.should_receive(:hidden).and_return comments

      get :index, :review => 'hidden'

      controller.should assign_to(:comments).with(comments)
    end
  end
end