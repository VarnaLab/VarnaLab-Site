class CommentsController < ApplicationController
  def create
    @page = find_page(params[:page_id])
    @comment = @page.comments.build(params[:comment])

    if @comment.save
      redirect_to page_path(@page, :anchor => dom_id(@comment))
    else
      render :template => 'pages/show'
    end
  end
end
