# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
