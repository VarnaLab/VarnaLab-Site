require 'spec_helper'

describe Admin::PagesController do
  let(:page) { Factory.stub(:page) }

  describe "GET index" do
    it "assigns the root pages" do
      Page.should_receive(:root).and_return 'root_pages'

      get :index

      controller.should assign_to(:pages).with('root_pages')
    end
  end

  describe "POST create" do
    it "redirects to the new page" do
      preform_create_on page

      response.should redirect_to(admin_page_url(page))
    end
  end

  describe "PUT update" do
    it "redirects to the page" do
      preform_update_on page

      response.should redirect_to(admin_page_url(page))
    end
  end
end
