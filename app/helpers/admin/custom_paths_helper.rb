module Admin::CustomPathsHelper
  def visible_admin_comments_path
    admin_comments_path :review => 'visible'
  end

  def hidden_admin_comments_path
    admin_comments_path :review => 'hidden'
  end
end