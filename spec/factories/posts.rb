FactoryGirl.define do

  factory :post do
    content "post"
    comment false
    association :user, factory: :admin

    trait :comment do
      content "comment"
      comment true
      association :user, factory: :user
    end

    factory :posts do
      transient do
        posts_count 2
      end

      after(:create) do |post, evaluator|
        create_list(:post, evaluator.posts_count)
      end
    end

    factory :comment, traits: [:comment] do
      factory :comments do
        transient do
          comments_count 2
        end

        after(:create) do |comment, evaluator|
          create_list(:comment, evaluator.comments_count)
        end
      end
    end
  end
end
