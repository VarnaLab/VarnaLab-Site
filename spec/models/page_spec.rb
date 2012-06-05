require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { FactoryGirl.create(:page).should validate_uniqueness_of(:name) }

  it { should belong_to(:parent) }
  it { should have_many(:children) }

  it_behaves_like 'a commentable' do
    def create_commentable
      FactoryGirl.create(:page)
    end
  end

  it "can give its visible chidren" do
    parent = FactoryGirl.create(:page)

    visible_child = FactoryGirl.create(:page, :parent => parent, :visible => true)
    hidden_child = FactoryGirl.create(:page, :parent => parent, :visible => false)

    parent.visible_children.should == [visible_child]
  end

  describe "scopes" do
    it "has visible pages" do
      visible_page = FactoryGirl.create(:page, :visible => true)
      hidden_page = FactoryGirl.create(:page, :visible => false)

      Page.visible.should == [visible_page]
    end
  end

  describe "reordering" do
    let(:root) { FactoryGirl.create(:page) }

    before do
      page_1 = FactoryGirl.create(:page, :parent => root)
      page_2 = FactoryGirl.create(:page, :parent => root)
      page_3 = FactoryGirl.create(:page, :parent => root)

      @expected_order = [page_3, page_1, page_2]
    end

    def reorder_pages
      Page.reorder(@expected_order.map(&:id))
    end

    it "sorts the given pages" do
      reorder_pages

      root.children.ordered.should == @expected_order
    end

    it "keeps the nested set behavior" do
      other_root = FactoryGirl.create(:page)

      reorder_pages

      Page.ordered.should == [root] + @expected_order + [other_root]
    end

    it "keeps the pairs of lft and rgt" do
      -> {
        reorder_pages
      }.should_not change { Page.ordered.map { |page| [page.lft, page.rgt] } }
    end

    it "accepts nil as argument" do
      -> { Page.reorder(nil) }.should_not raise_error
    end
  end
end
