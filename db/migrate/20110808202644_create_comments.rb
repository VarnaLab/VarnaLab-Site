class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id, :null => false
      t.string :commentable_type, :null => false
      t.string :commenter_name
      t.string :commenter_email
      t.text :body, :null => false
      t.timestamps
    end
  end
end
