Given 'a visitor have posted a comment "$text"' do |comment_body|
  @comment = Factory(:visitor_comment, :body => comment_body)
end

When 'I hide the comment' do
  click_link "Hide comment ##{@comment.id}"
end

Then 'the comment should be hidden' do
  @comment.reload
  @comment.should be_hidden
end
