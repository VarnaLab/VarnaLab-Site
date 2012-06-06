class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.references :author
      t.datetime :date
      t.string :place

      t.timestamps
    end
    add_index :events, :author_id
  end
end
