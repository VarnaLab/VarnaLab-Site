class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :index, :show, :new, :create, :edit, :update, :destroy
end
