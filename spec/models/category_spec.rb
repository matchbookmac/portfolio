require "rails_helper"

describe Category do
  it { should have_and_belong_to_many :profiles }
  it { should validate_presence_of :language }
  it { should validate_presence_of :description }
end
