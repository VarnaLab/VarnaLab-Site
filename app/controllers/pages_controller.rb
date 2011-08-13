class PagesController < ApplicationController
  def index
  end

  def show
    @page = Page.find(params[:id])
  end
end
