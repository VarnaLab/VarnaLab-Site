require 'spec_helper'

describe CommentsController do
  let(:page) { Factory.stub(:page) }
  let(:comment) { Factory.stub(:comment) }

  describe "POST 'create'" do
    before do
      controller.stub :find_page => page
      page.comments.stub :build => comment
      comment.stub :save!
    end

    it "assigns the parent page as @page" do
      controller.should_receive(:find_page).with('1').and_return page

      post :create, :page_id => '1'

      controller.should assign_to(:page).with(page)
    end

    it "assigns the new comment as @comment" do
      page.comments.should_receive(:build).with('these' => 'values').and_return comment

      post :create, :page_id => '1', :comment => {'these' => 'values'}

      controller.should assign_to(:comment).with(comment)
    end

    it "creates a comment" do
      comment.should_receive(:save!)

      post :create, :page_id => '1'
    end

    it "redirects to the page" do
      post :create, :page_id => '1'

      anchor = controller.dom_id(comment)

      controller.should redirect_to(page_path(page, :anchor => anchor))
    end
  end
end
