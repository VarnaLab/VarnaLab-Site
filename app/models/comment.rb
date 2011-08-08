class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :commenter_name, :commenter_email, :commentable, :body
end