require 'spec_helper'

describe PagesController do
  let(:page) { Factory.stub(:page) }

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "assings the page as @page" do
      controller.should_receive(:find_page).with('1').and_return page

      get :show, :id => '1'
    end
  end
end
