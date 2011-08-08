class Admin::Comments::HideController < Admin::BaseController
  def create
    find_comment.hide!

    redirect_to admin_comments_path, :notice => 'The comment was successfully hidden'
  end

  def destroy
    find_comment.show!

    redirect_to admin_comments_path, :notice => 'The comment was successfully marked as visible'
  end

  private

  def find_comment
    Comment.find(params[:comment_id])
  end
end
