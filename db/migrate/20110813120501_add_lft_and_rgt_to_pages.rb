class AddLftAndRgtToPages < ActiveRecord::Migration
  def change
    add_column :pages, :lft, :integer, :null => false, :default => 0
    add_column :pages, :rgt, :integer, :null => false, :default => 0
  end
end