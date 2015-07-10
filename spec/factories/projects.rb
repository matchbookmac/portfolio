FactoryGirl.define do
  sequence :name do |n|
    "App ##{n}"
  end

  factory :project do
    name
    description "An app"
    repo_URL "https://github.com/person/stuff"

    factory :projects do
      transient do
        projects_count 2
      end

      after(:create) do |project, evaluator|
        create_list(:project, evaluator.projects_count)
      end
    end
  end
end
