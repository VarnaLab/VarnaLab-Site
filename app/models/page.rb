class Page < ActiveRecord::Base
  validates_presence_of :name, :content
  validates_uniqueness_of :name

  belongs_to :parent, :class_name => 'Page'
  has_many :children, :class_name => 'Page', :foreign_key => 'parent_id', :dependent => :destroy

  scope :root, where(:parent_id => nil)
end
