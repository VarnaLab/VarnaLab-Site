class Admin::Comments::HideController < Admin::BaseController
  def create
    comment = Comment.find(params[:comment_id])
    comment.hide!

    redirect_to admin_comments_path, :notice => 'The comment was successfully hidden'
  end
end
