FactoryGirl.define do
  factory :user do
    first_name "Friendly"
    last_name  "User"
    bio "I love code"
    email "friendly@user.com"
    password "12341234"
    admin false

    trait :admin do
      admin true
      email "admin@user.com"
      password "admin1234"
    end

    factory :admin, traits: [:admin]

    factory :admin_with_projects, traits: [:admin] do

      after(:create) do |user|
        user.projects = [create(:projects)]
      end
    end
  end
end
