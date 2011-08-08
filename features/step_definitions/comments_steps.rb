Given 'a visitor comments on "$page" with "$text"' do |page_name, comment_body|
  page = Page.find_by_name!(page_name)
  Factory(:visitor_comment, :body => comment_body, :commentable => page)
end

When 'I hide the "$text" comment' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  click_link "Hide comment ##{comment.id}"
end

Then '"$text" comment should be hidden' do |comment_body|
  comment = Comment.find_by_body!(comment_body)
  comment.should be_hidden
end
