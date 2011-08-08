require 'spec_helper'

describe Admin::CommentsController do
  let(:comment) { Factory.stub(:comment) }

  describe "GET index" do
    it "assings comments as @comments" do
      Comment.should_receive(:all).and_return [comment]

      get :index

      controller.should assign_to(:comments).with([comment])
    end
  end
end