shared_examples_for 'a commentable' do
  # in most cases is Factory.create(:commentable, attributes)
  def create_commentable
    raise "Examples should define a factory #create_commentable"
  end

  let(:commentable) { create_commentable }

  def create_comment(attributes = {})
    attributes[:commentable] = commentable
    FactoryGirl.create(:comment, attributes)
  end

  it { should have_many(:comments) }

  it "can count its visible comments" do
    visible_comment = create_comment :hidden => false
    hidden_comment = create_comment :hidden => true

    commentable.visible_comments_count.should == 1
  end

  it "can select its visible comments" do
    visible_comment = create_comment :hidden => false
    hidden_comment = create_comment :hidden => true

    commentable.visible_comments.should == [visible_comment]
  end

  describe "building comment" do
    it "creates a new comment from the commentable" do
      comment = commentable.build_comment(:commenter_name => 'tester')
      comment.commentable.should == commentable
      comment.commenter_name.should == 'tester'
      comment.should be_new_record
    end

    it "raises an exception if the commentable can't have comments" do
      commentable.commentable = false

      -> { commentable.build_comment }.should raise_error
    end
  end
end
