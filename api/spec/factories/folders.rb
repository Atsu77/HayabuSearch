FactoryBot.define do
  factory :folder do
    association :user, factory: :user_yamada
    name { 'YouTube' }
  end
end
