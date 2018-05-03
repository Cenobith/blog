FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "testtest"
    password_confirmation "testtest"

    factory :admin do
      admin true
    end
  end
end
