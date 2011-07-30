module Admin::BaseHelper
  def link_to_edit resource
    resource_name = resource.name
    link_to 'Edit', [:edit, :admin, resource], :title => "Edit '#{resource_name}' page"
  end

  def link_to_delete resource, options = {}
    resource_name = resource.name

    attributes = {
      :title => "Delete '#{resource_name}' page",
      :remote => true,
      :method => :delete,
      :confirm => "Are you sure you want to delete #{resource_name}?",
    }.merge(options)

    link_to 'Delete', [:admin, resource], attributes
  end

  def link_to_cancel path
    link_to 'Cancel', path, 'data-transition' => 'slide-left'
  end
end