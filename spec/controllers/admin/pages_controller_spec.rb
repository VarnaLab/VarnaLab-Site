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

  describe "PUT update" do
    it "redirects to admin pages path if page is a root page" do
      page.stub :root? => true

      preform_update_on page

      response.should redirect_to(admin_pages_url)
    end

    it "redirects to the page's parent admin page if the page is not a root page" do
      page.stub :root? => false, :parent => Factory.stub(:page)

      preform_update_on page

      response.should redirect_to(admin_page_url(page.parent))
    end
  end

  def preform_update_on(model, options = {:successful => true})
    model.stub :update_attributes => options[:successful]
    controller.stub :resource => model

    put :update, :id => model.id
  end
end
