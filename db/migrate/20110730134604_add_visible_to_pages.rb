class AddVisibleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :visible, :boolean, :null => false, :default => true
  end
end