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
    it "redirects to admin pages path if the new page is a root page" do
      page.stub :root? => true

      preform_create_on page

      response.should redirect_to(admin_pages_url)
    end

    it "redirects to the new page's parent admin page if the new page is not a root page" do
      page.stub :root? => false, :parent => Factory.stub(:page)

      preform_create_on page

      response.should redirect_to(admin_page_url(page.parent))
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
    controller.send :set_resource_ivar, model

    put :update, :id => model.id
  end

  def preform_create_on(model, options = {:successful => true})
    model.stub :save => options[:successful]
    controller.send :set_resource_ivar, model

    post :create
  end
end
