require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { Factory(:page).should validate_uniqueness_of(:name) }
  it { should belong_to(:parent) }
  it { should have_many(:children) }

  describe "(root pages)" do
    it "can give its root pages" do
      root_page = Factory(:page)
      child_page = Factory(:page, :parent => root_page)

      Page.root.should == [root_page]
    end

    specify "page without parent page is a root page" do
      Page.new.should be_root
    end

    specify "page with parent page is not a root page" do
      Page.new(:parent_id => 1).should_not be_root
    end
  end
end
