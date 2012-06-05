Given /^a(?:nother)? visitor have posted a comment "([^"]+)"$/ do |comment_body|
  @comment = FactoryGirl.create(:visitor_comment, :body => comment_body)
end

Given 'the comment was hidden' do
  @comment.review_with! false
end

Given 'a visitor comments on it with "$text"' do |comment_body|
  FactoryGirl.create(:visitor_comment, :commentable => @page, :body => comment_body)
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

When 'I fill in "$text" comment' do |comment_body|
  fill_in 'Name', :with => 'My Name'
  fill_in 'E-mail', :with => 'my.email@example.com'
  fill_in 'Comment', :with => comment_body
end

When 'I submit the comment' do
  click_button 'Comment'
end

When 'I leave "$text" comment on "$name" page' do |comment_body, page_name|
  step %Q(I go to the "#{page_name}" page)
  step %Q(I fill in "#{comment_body}" comment)
  step %Q(I submit the comment)
end

When 'I try to leave blank comment on "$name" page' do |page_name|
  step %Q(I go to the "#{page_name}" page)
  step %Q(I submit the comment)
end

Then 'the comment should be hidden' do
  @comment.reload
  @comment.should be_hidden

  visit page_path(@comment.commentable)
  page.should_not have_content(@comment.body)
end

Then '"$text" comment should be hidden' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  comment.should be_hidden
end

Then 'the comment should be visible' do
  @comment.reload
  @comment.should_not be_hidden

  visit page_path(@comment.commentable)
  page.should have_content(@comment.body)
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

Then '"$name" page should have one comment' do |page_name|
  page = Page.find_by_name!(page_name)
  page.reload.should have(1).comment
end

Then '"$name" page should have no comments' do |page_name|
  page = Page.find_by_name!(page_name)
  page.reload.should have(0).comments
end

Then 'I should see "$text" comment' do |comment_body|
  page.should have_content(comment_body)
end

