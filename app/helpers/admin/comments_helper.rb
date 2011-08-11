module Admin::CommentsHelper
  def unreviewed_comments_badge
    count = Comment.unreviewed.count

    options = {:id => 'unreviewed-comments-count', :title => pluralize(count, 'unreviewed comment')}
    options[:style] = 'display:none' if count == 0

    content_tag :spam, count, options
  end
end