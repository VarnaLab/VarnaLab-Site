class RenamePageTitleToName < ActiveRecord::Migration
  def up
    rename_column :pages, :title, :name
  end

  def down
    rename_column :pages, :name, :title
  end
end