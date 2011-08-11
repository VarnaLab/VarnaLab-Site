require 'spec_helper'

describe Admin::CommentsController do
  let(:comments) { [Factory.stub(:comment)] }

  describe "GET index" do
    it "assings visible comments as @comments" do
      Comment.should_receive(:unreviewed).and_return comments

      get :index

      controller.should assign_to(:comments).with(comments)
    end
  end

  describe "GET visible" do
    it "assigns visible comments as @comments" do
      Comment.should_receive(:visible).and_return comments

      get :visible

      controller.should assign_to(:comments).with(comments)
    end
  end

  describe "GET hidden" do
    it "assings hidden comments as @comments" do
      Comment.should_receive(:hidden).and_return comments

      get :hidden

      controller.should assign_to(:comments).with(comments)
    end
  end
end