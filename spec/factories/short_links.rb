FactoryBot.define do
  factory :short_link do
    sequence (:full_url) { |n| "https://test#{n}.com" }
    sequence (:user_id) { |n| n }
  end
end