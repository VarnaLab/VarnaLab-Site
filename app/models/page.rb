class Page < ActiveRecord::Base
  include Comment::Commentable

  validates_presence_of :name
  validates_uniqueness_of :name

  acts_as_nested_set

  scope :visible, where(:visible => true)
  scope :ordered, order('lft ASC')

  class << self
    def reorder(ids)
      return if ids.blank?
      attributes = where(:id => ids).ordered.map { |page| {:lft => page.lft, :rgt => page.rgt} }
      ids.each_with_index do |id, index|
        Page.update_all(attributes[index], :id => id)
      end
    end
  end

  def visible_children
    children.visible.ordered
  end

  def hidden?
    not visible
  end
end
