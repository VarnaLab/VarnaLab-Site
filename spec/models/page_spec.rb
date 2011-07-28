require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { Factory(:page).should validate_uniqueness_of(:name) }
  it { should belong_to(:parent) }
  it { should have_many(:children) }

  it "can give its root pages" do
    root_page = Factory(:page)
    child_page = Factory(:page, :parent => root_page)

    Page.root.should == [root_page]
  end
end
