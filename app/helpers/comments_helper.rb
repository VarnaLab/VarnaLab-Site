module CommentsHelper
  def new_comment_form_for(commentable, &block)
    form_id = 'new-comment'
    comment = @comment || Comment.new
    url = page_comments_path(commentable, :anchor => form_id)

    simple_form_for comment, :url => url, :html => {:id => form_id}, &block
  end
end