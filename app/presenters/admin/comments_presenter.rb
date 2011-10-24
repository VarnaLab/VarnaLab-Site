class Admin::CommentsPresenter
  def initialize(options = {})
    @options = options
  end

  def comments
    @comments ||= comments_scope.order('created_at DESC').page(@options[:page] || 1)
  end

  def title
    title = "#{review.titleize} comments"
    title << " for #{commentable.name}" if commentable.present?
    title
  end

  private

  def review
    @options[:review] || 'all'
  end

  def commentable
    @options[:commentable]
  end

  def comments_scope
    scope = commentable.presence.try(:comments) || Comment
    case review
      when 'visible'    then scope.visible
      when 'hidden'     then scope.hidden
      when 'unreviewed' then scope.unreviewed
      when 'all'        then scope
      else raise "Invalid review state - #{options[:review]}"
    end
  end
end
