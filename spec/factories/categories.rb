FactoryGirl.define do
  sequence :language do |n|
    "language ##{n}"
  end

  factory :category do
    language
    description "An elegant oo language"

    factory :categories do
      transient do
        categories_count 2
      end

      after(:create) do |category, evaluator|
        create_list(:category, evaluator.categories_count)
      end
    end
  end
end
