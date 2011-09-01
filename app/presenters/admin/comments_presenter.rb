class Admin::CommentsPresenter
  attr_reader :comments, :review

  def initialize(params = {})
    @review = params[:review] || 'unreviewed'
    @scope = params[:commentable].presence.try(:comments) || Comment
    @comments = comments_scope.order('created_at DESC').page(params[:page])
  end

  private

  def comments_scope
    case @review
      when 'visible'    then @scope.visible
      when 'hidden'     then @scope.hidden
      when 'unreviewed' then @scope.unreviewed
      else raise "Invalid review state - #{params[:review]}"
    end
  end
end