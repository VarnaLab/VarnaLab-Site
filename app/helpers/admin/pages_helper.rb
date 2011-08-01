module Admin::PagesHelper
  def link_to_adding_a_subpage page
    link_to 'Add subpage', new_admin_page_path(:page => {:parent_id => page.id}), :title => "Add a subpage of '#{page.name}'"
  end

  def link_to_parent_page page
    name, link = page.parent.present? ? [page.parent.name, admin_page_path(page.parent)] : ['Pages', admin_page_path]

    link_to name.truncate(20), link, 'data-transition' => 'slide-left', :title => %Q(Go back to "#{name}")
  end

  def page_status_box page
    class_names  = ['status-box']
    class_names << 'invisible' unless page.visible?

    title = page.visible ? 'Visible page' : 'Invisible page'

    content_tag :div, '', :class => class_names, :title => title
  end
end