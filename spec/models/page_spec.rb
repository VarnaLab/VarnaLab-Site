require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { Factory(:page).should validate_uniqueness_of(:name) }
end
