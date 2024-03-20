FactoryBot.define do
  factory :user do
    id { 1 }
    email {"email@email.com"}
    password_digest {"awefawef"}
    created_at { Time.now }
    updated_at { "2024-03-20 00:00:00" }
  end
end
