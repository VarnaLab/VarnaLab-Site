class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :commenter_name, :commenter_email, :commentable, :body
  validates_format_of :commenter_email, :with => /.+@.+\.\w+/

  attr_protected :hidden, :reviewed

  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  scope :unreviewed, where(:reviewed => false)

  def review_with!(approved)
    self.hidden = !approved
    self.reviewed = true
    save!
  end

  module Commentable
    def self.included(base)
      base.has_many :comments, :as => :commentable
    end

    def build_comment(attributes = {})
      raise "You can't comment on uncommentable entry" unless commentable?
      comments.build(attributes)
    end

    def visible_comments
      comments.visible
    end

    def visible_comments_count
      visible_comments.count
    end
  end
end