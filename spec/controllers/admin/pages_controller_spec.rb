require 'spec_helper'

describe Admin::PagesController do
  describe "GET index" do
    it "assigns the root pages" do
      Page.should_receive(:root).and_return 'root_pages'

      get :index

      controller.should assign_to(:pages).with('root_pages')
    end
  end
end
