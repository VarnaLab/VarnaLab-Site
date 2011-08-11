class Admin::CommentsPresenter
  attr_reader :comments, :review

  def initialize(params = {})
    @review = params[:review] || 'unreviewed'
    @comments = comments_scope.order('created_at DESC').page(params[:page])
  end

  private

  def comments_scope
    case @review
      when 'visible'    then Comment.visible
      when 'hidden'     then Comment.hidden
      when 'unreviewed' then Comment.unreviewed
      else raise "Invalid review state - #{params[:review]}"
    end
  end
end