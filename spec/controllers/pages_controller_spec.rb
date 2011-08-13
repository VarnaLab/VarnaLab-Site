require 'spec_helper'

describe PagesController do
  let(:page) { Factory.stub(:page) }

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
