FactoryBot.define do
  factory :user do
    id {}
    email {}
    password_digest {}
    created_at { Time.now }
    updated_at { "2024-03-20 00:00:00" }
  end
end
