FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    image { 'sample.jpg' }
    user { User.first || association(:user) }
  end
end
