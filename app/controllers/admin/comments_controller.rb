class Admin::CommentsController < Admin::BaseController
  def index
    @presenter = Admin::CommentsPresenter.new(presenter_options)
  end

  private

  def presenter_options
    options = {:review => params[:review]}
    options[:commentable] = Page.find(params[:page_id]) if params[:page_id].present?
    options
  end
end
