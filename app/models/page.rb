class Page < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_uniqueness_of :title
end
