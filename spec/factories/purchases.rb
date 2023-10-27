FactoryBot.define do
  factory :purchase do
    name { 'Sample Purchase' }
    amount { 100 }
    author { association :user }
  end
end
