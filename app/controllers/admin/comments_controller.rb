class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.visible
  end

  def hidden
    @comments = Comment.hidden

    render 'index'
  end
end
