FactoryGirl.define do

  factory :user do
    first_name "Friendly"
    last_name  "User"
    bio "I love code"
    sequence(:email) { |n| "#{n}@user.com" }
    sequence(:password, 10000000) { |n| "#{n}" }
    admin false

    trait :admin do
      admin true
      first_name "Nice"
      last_name  "Admin"
      sequence(:email) { |n| "admin#{n}@user.com" }
      sequence(:password, 10000000) { |n| "#{n}admin" }
    end

    trait :logged_in do
      after(:create) { |user| login_as user, scope: :user }
    end

    factory :logged_in_user, traits: [:logged_in]

    factory :admin, traits: [:admin]

    factory :logged_in_admin, traits: [:admin, :logged_in]

    factory :admin_with_projects, traits: [:admin] do
      after(:create) do |admin|
        admin.projects = [create(:projects)]
      end
    end

    factory :admin_with_categories, traits: [:admin] do
      after(:create) do |admin|
        admin.categories = [create(:categories)]
      end
    end

    factory :admin_with_posts, traits: [:admin] do
      after(:create) do |admin|
        admin.posts = [create(:posts)]
      end
    end

    factory :user_with_comments do
      after(:create) do |user|
        user.posts = [create(:comments)]
      end
    end
  end
end
