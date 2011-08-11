class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Admin::CommentsPresenter.find_comments(params)
  end
end
