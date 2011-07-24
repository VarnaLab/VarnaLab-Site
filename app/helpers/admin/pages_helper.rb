module Admin::PagesHelper
  def link_to_adding_a_subpage page
    link_to 'Add subpage', new_admin_page_path(:page => {:parent_id => page.id}), :title => "Add a subpage of '#{page.name}'"
  end
end