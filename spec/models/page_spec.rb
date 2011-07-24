require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
