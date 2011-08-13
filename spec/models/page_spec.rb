require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { Factory(:page).should validate_uniqueness_of(:name) }

  it { should belong_to(:parent) }
  it { should have_many(:children) }
  it { should have_many(:comments) }
end
