require 'spec_helper'

describe CommentsController do
  let(:page) { FactoryGirl.build_stubbed(:page) }
  let(:comment) { FactoryGirl.build_stubbed(:comment) }

  describe "POST 'create'" do
    before do
      controller.stub :find_page => page
      page.stub :build_comment => comment
      comment.stub :save => true
    end

    it "assigns the parent page as @page" do
      controller.should_receive(:find_page).with('1').and_return page

      post :create, :page_id => '1'

      controller.should assign_to(:page).with(page)
    end

    it "assigns the new comment as @comment" do
      page.should_receive(:build_comment).with('these' => 'values').and_return comment

      post :create, :page_id => '1', :comment => {'these' => 'values'}

      controller.should assign_to(:comment).with(comment)
    end

    it "creates a comment" do
      comment.should_receive(:save)

      post :create, :page_id => '1'
    end

    it "redirects to the page" do
      post :create, :page_id => '1'

      anchor = controller.dom_id(comment)

      response.should redirect_to(page_path(page, :anchor => anchor))
    end

    it "renders the page if comment can't be created" do
      comment.stub :save => false

      post :create, :page_id => '1'

      response.should render_template('pages/show')
    end
  end
end
