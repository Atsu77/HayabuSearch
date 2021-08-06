FactoryBot.define do
  factory :user do
  end

  factory :user_yamada, class: 'User' do
    name { '山田太郎' }
    email { 'yamada@example.com' }
    password { 'password' }
  end

  factory :user_satou, class: 'User' do
    name { '佐藤花子' }
    email { 'satou@example.com' }
    password { 'password' }
  end
end
