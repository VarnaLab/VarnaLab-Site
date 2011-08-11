Given /^a(?:nother)? visitor have posted a comment "([^"]+)"$/ do |comment_body|
  @comment = Factory(:visitor_comment, :body => comment_body)
end

Given 'the comment was hidden' do
  @comment.review_with! false
end

When 'I hide the comment' do
  click_link "Hide comment ##{@comment.id}"
end

When 'I hide the comment "$text"' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  click_link "Hide comment ##{comment.id}"
end

When 'I show the comment' do
  click_link "Show comment ##{@comment.id}"
end

When 'I approve the comment "$text"' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  click_link "Approve comment ##{comment.id}"
end

Then 'the comment should be hidden' do
  @comment.reload
  @comment.should be_hidden
end

Then '"$text" comment should be hidden' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  comment.should be_hidden
end

Then 'the comment should be visible' do
  @comment.reload
  @comment.should_not be_hidden
end

Then '"$text" comment should be visible' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  comment.should_not be_hidden
end

Then 'there should be no unreviewed comments' do
  within '#unreviewed-comments-count' do
    page.should have_content('0')
  end
end