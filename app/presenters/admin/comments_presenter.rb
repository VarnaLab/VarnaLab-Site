class Admin::CommentsPresenter
  attr_reader :comments

  def initialize(options = {})
    @review = options[:review] || 'all'
    @commentable = options[:commentable]
    @scope = @commentable.presence.try(:comments) || Comment
    @comments = comments_scope.order('created_at DESC').page(options[:page])
  end

  def title
    title = "#{@review.titleize} comments"
    title << " for #{@commentable.name}" if @commentable.present?
    title
  end

  private

  def comments_scope
    case @review
      when 'visible'    then @scope.visible
      when 'hidden'     then @scope.hidden
      when 'unreviewed' then @scope.unreviewed
      when 'all'        then @scope
      else raise "Invalid review state - #{options[:review]}"
    end
  end
end