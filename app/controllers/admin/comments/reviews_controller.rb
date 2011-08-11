class Admin::Comments::ReviewsController < Admin::BaseController
  def create
    find_comment.review_with! true

    redirect_to admin_comments_path, :notice => 'The comment was successfully marked as visible'
  end

  def destroy
    find_comment.review_with! false

    redirect_to admin_comments_path, :notice => 'The comment was successfully hidden'
  end

  private

  def find_comment
    Comment.find(params[:comment_id])
  end
end
