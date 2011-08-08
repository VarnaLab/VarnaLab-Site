require 'spec_helper'

describe Comment do
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:commentable) }
  it { should validate_presence_of(:commenter_name) }
  it { should validate_presence_of(:commenter_email) }
  it { should validate_presence_of(:body) }
end
