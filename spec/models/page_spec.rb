require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { Factory(:page).should validate_uniqueness_of(:name) }

  it { should belong_to(:parent) }
  it { should have_many(:children) }
  it { should have_many(:comments) }

  describe "scopes" do
    it "has visible pages" do
      visible_page = Factory(:page, :visible => true)
      hidden_page = Factory(:page, :visible => false)

      Page.visible.should == [visible_page]
    end
  end
end
