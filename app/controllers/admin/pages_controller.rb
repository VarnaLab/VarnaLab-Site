class Admin::PagesController < Admin::BaseController

  before_filter :authenticate_user!
  inherit_resources

  actions :show, :new, :create, :update, :edit, :destroy

  def index
    @pages = Page.roots
  end

  def destroy
    destroy! :flash => !request.xhr?
  end
end
