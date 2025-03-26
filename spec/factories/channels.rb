FactoryBot.define do
  factory :channel do
    name { Faker::Lorem.name }
    description { Faker::Lorem.sentence }
  end
end
