#added by Marta Kostova
class Member < ActiveRecord::Base
  
  validates_presence_of :member_name, :member_email
  validates_format_of :member_email, :with => /.+@.+\.\w+/

  attr_protected :hidden, :reviewed

  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  scope :unreviewed, where(:reviewed => false)

  def review_with!(approved)
    self.hidden = !approved
    self.reviewed = true
    save!
  end
end