class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :show, :new, :create, :update, :edit, :destroy

  def index
    @pages = Page.root
  end

  private

  def smart_resource_url
    unless @page.root?
      admin_page_path(@page.parent)
    else
      admin_pages_path
    end
  end
end
