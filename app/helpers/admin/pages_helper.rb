module Admin::PagesHelper
  def link_to_adding_a_subpage(page)
    link_to 'Add subpage', new_admin_page_path(:page => {:parent_id => page.id}), :title => "Add a subpage of '#{page.name}'"
  end

  def link_to_parent_page(page)
    name, link = page.parent.present? ? [page.parent.name, admin_page_path(page.parent)] : ['Pages', admin_pages_path]
    link_to name.truncate(20), link, :title => %Q(Go back to "#{name}")
  end

  def link_to_comments_of(page)
    count = page.visible_comments_count
    link_to "Comments (#{count})", admin_page_comments_path(page, 'visible'), :title => "Visible comments - #{count}"
  end

  def page_status_box(page)
    class_names  = ['status-box']
    class_names << 'invisible' unless page.visible?

    title = page.visible ? 'Visible page' : 'Invisible page'

    content_tag :div, '', :class => class_names, :title => title
  end
end