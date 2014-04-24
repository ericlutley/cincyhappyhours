FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "123456789"
    name "John Doe"

    factory :admin do
      admin true
    end
  end
end
