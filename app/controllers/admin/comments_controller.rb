class Admin::CommentsController < Admin::BaseController
  def index
    @comments = case params[:review]
      when 'visible' then Comment.visible
      when 'hidden' then Comment.hidden
      else Comment.unreviewed
    end
  end
end
