require "rails_helper"

describe Profile do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :bio }

  it { should have_and_belong_to_many  :categories}
end
