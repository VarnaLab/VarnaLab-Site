class PagesController < ApplicationController
  def index
  end

  def show
    @page = find_page(params[:id])
  end
end
