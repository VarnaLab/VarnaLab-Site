class AddReviewedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :reviewed, :boolean, :default => false, :null => false
  end
end