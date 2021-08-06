# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image_url              :string
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
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
