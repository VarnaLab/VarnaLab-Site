module Admin::PagesHelper
  def link_to_adding_a_subpage page
    link_to 'Add subpage', new_admin_page_path(:page => {:parent_id => page.id}), :title => "Add a subpage of '#{page.name}'"
  end

  def link_to_parent_page page
    link_to 'Back', page.parent_id.present? ? admin_page_path(page.parent_id) : admin_pages_path
  end

  def page_status_box page
    class_names  = ['status-box']
    class_names << 'invisible' unless page.visible?

    title = page.visible ? 'Visible page' : 'Invisible page'

    content_tag :div, '', :class => class_names, :title => title
  end
end