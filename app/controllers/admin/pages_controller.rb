class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :show, :new, :create, :update, :edit, :destroy

  def index
    @pages = Page.root
  end

  def update
    update! :location => resource.root? ? admin_pages_path : admin_page_path(resource.parent)
  end
end
