class Admin::CommentsController < Admin::BaseController
  def index
    @presenter = Admin::CommentsPresenter.new(:review => params[:review])
  end
end
