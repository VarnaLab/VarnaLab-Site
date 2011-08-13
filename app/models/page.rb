class Page < ActiveRecord::Base
  validates_presence_of :name, :content
  validates_uniqueness_of :name

  has_many :comments, :as => :commentable

  acts_as_nested_set

  scope :visible, where(:visible => true)

  def visible_children
    children.visible
  end

  def hidden?
    not visible
  end
end
