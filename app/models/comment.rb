class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :commenter_name, :commenter_email, :commentable, :body
  validates_format_of :commenter_email, :with => /.+@.+\.\w+/

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