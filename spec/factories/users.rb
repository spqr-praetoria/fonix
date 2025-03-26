FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    confirmed_at { Time.current }

    trait :with_name do
      username { "John Doe" }
    end

    trait :with_three_part_name do
      username { "John Middle Doe" }
    end

    trait :with_spaced_name do
      username { "John  Doe  " }
    end
  end
end
