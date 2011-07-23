module Admin::BaseHelper
  def link_to_edit resource
    resource_name = resource.title
    link_to 'edit', [:edit, :admin, resource], :title => "Edit '#{resource_name}' page"
  end

  def link_to_delete resource
    resource_name = resource.title
    link_to 'delete', [:admin, resource], :title => "Delete '#{resource_name}' page", :method => :delete, :confirm => "Are you sure you want to delete #{resource_name}?"
  end
end