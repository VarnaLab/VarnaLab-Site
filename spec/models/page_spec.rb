require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { Factory(:page).should validate_uniqueness_of(:name) }

  it { should belong_to(:parent) }
  it { should have_many(:children) }

  it_behaves_like 'a commentable' do
    def create_commentable
      Factory(:page)
    end
  end

  it "can give its visible chidren" do
    parent = Factory(:page)

    visible_child = Factory(:page, :parent => parent, :visible => true)
    hidden_child = Factory(:page, :parent => parent, :visible => false)

    parent.visible_children.should == [visible_child]
  end

  describe "scopes" do
    it "has visible pages" do
      visible_page = Factory(:page, :visible => true)
      hidden_page = Factory(:page, :visible => false)

      Page.visible.should == [visible_page]
    end
  end
end
