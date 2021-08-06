# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_histories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :history do
  end

  factory :history_yamada_1, class: 'History' do
    association :user, factory: :user_yamada
    url { 'https://google.com' }
    title { 'Google' }
  end

end
