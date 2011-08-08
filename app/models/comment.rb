class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :commenter_name, :commenter_email, :commentable, :body

  attr_protected :hidden

  def hide!
    self.hidden = true
    save!
  end

  def show!
    self.hidden = false
    save!
  end
end