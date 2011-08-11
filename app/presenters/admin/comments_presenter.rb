module Admin::CommentsPresenter
  def self.find_comments(params = {})
    case params[:review]
      when 'visible' then Comment.visible
      when 'hidden'  then Comment.hidden
      when nil       then Comment.unreviewed
      else raise "Invalid review state - #{params[:review]}"
    end
  end
end