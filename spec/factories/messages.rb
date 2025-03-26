FactoryBot.define do
  factory :message do
    content { Faker::Lorem.paragraph }
    user { nil }
    channel { nil }
  end
end
