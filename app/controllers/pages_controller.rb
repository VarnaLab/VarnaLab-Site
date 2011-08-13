class PagesController < ApplicationController
  def index
  end

  def show
    @page = find_page(params[:id])
  end

  private

  def find_page(id)
    Page.visible.find(id)
  end
end
