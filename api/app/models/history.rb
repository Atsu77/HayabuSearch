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
class History < ApplicationRecord
  belongs_to :user

  has_many :history_tag
  has_many :history_folder
  
  validates :url, :title, presence: true
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :title, length: { maximum: 30 }
end
