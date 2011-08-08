class AddHiddenToComments < ActiveRecord::Migration
  def change
    add_column :comments, :hidden, :boolean, :default => false, :null => false
  end
end