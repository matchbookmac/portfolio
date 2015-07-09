FactoryGirl.define do
  factory :user do
    first_name "Ian"
    last_name  "MacDonald"
    bio "I love code"
    admin true
  end

  factory :admin, class: User do
    first_name "Ian"
    last_name  "MacDonald"
    bio "I love code"
    admin true
  end
end
