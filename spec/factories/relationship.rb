FactoryGirl.define do

  factory :relationship do
    association :reference, factory: :user
    sequence(:relationship) { |n| "boss#{n}" }
  end
end
