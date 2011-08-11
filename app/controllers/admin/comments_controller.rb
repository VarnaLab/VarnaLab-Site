class Admin::CommentsController < Admin::BaseController
  def index
    @presenter = Admin::CommentsPresenter.new(params)
  end
end
