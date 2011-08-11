class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.unreviewed
  end

  def visible
    @comments = Comment.visible

    render 'index'
  end

  def hidden
    @comments = Comment.hidden

    render 'index'
  end
end
