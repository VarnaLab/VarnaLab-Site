class Admin::PagesController < Admin::BaseController
  inherit_resources

  actions :index, :new, :create
end
