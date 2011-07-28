class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :show, :new, :create, :edit, :update, :destroy

  def index
    @pages = Page.root
  end
end
