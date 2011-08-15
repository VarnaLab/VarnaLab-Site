shared_examples_for 'a commentable' do
  # in most cases is Factory.create(:commentable, attributes)
  def create_commentable
    raise "Examples should define a factory #create_commentable"
  end

  let(:commentable) { create_commentable }

  def create_comment(attributes = {})
    attributes[:commentable] = commentable
    Factory(:comment, attributes)
  end

  it { should have_many(:comments) }

  it "can build comments" do
    comment = commentable.build_comment(:commenter_name => 'tester')
    comment.commenter_name.should == 'tester'
    comment.should be_new_record
  end

  describe "visible comments" do
    it "selects only visible comments" do
      visible_comment = create_comment :hidden => false
      hidden_comment = create_comment :hidden => true

      commentable.visible_comments.should == [visible_comment]
    end
  end
end
