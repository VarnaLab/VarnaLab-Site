Given 'a visitor have posted a comment "$text"' do |comment_body|
  @comment = Factory(:visitor_comment, :body => comment_body)
end

Given 'the comment was hidden' do
  @comment.hide!
end

When 'I hide the comment' do
  click_link "Hide comment ##{@comment.id}"
end

When 'I show the comment' do
  click_link "Show comment ##{@comment.id}"
end

Then 'the comment should be hidden' do
  @comment.reload
  @comment.should be_hidden
end

Then 'the comment should be visible' do
  @comment.reload
  @comment.should_not be_hidden
end
