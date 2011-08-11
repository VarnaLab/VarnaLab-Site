require 'spec_helper'

describe Admin::CommentsController do
  let(:comment) { Factory.stub(:comment) }

  describe "GET index" do
    it "assings visible comments as @comments" do
      Comment.should_receive(:visible).and_return [comment]

      get :index

      controller.should assign_to(:comments).with([comment])
    end
  end

  describe "GET hidden" do
    it "assings hidden comments as @comments" do
      Comment.should_receive(:hidden).and_return [comment]

      get :hidden

      controller.should assign_to(:comments).with([comment])
    end
  end
end