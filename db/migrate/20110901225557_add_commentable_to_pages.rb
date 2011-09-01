class AddCommentableToPages < ActiveRecord::Migration
  def change
    add_column :pages, :commentable, :boolean, :default => true, :null => false
  end
end