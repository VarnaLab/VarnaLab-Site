class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :show, :new, :create, :update, :edit, :destroy

  def index
    @pages = Page.root
  end

  def create
    create! :location => go_to_after_save
  end

  def update
    update! :location => go_to_after_save
  end

  private

  def go_to_after_save
    unless @page.root?
      admin_page_path(@page.parent)
    else
      admin_pages_path
    end
  end
end
