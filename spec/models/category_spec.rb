require "rails_helper"

describe Category do
  it { should validate_presence_of :language }
  it { should validate_uniqueness_of :language }
  it { should validate_presence_of :description }

  it { should have_and_belong_to_many :users }
  it { should have_and_belong_to_many :projects }
end
