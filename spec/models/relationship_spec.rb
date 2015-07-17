require "rails_helper"

describe Relationship do
  it { should validate_presence_of :relationship }

  it { should belong_to :user }
  it { should belong_to :reference }
end
