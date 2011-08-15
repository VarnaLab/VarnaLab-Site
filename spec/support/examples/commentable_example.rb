shared_examples_for 'a commentable' do
  # in most cases is Factory.create(:commentable, attributes)
  def create_commentable
    raise "Examples should define a factory #create_commentable"
  end

  let(:commentable) { create_commentable }

  it { should have_many(:comments) }
end
