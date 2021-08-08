# == Schema Information
#
# Table name: history_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  history_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_history_tags_on_history_id  (history_id)
#  index_history_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (history_id => histories.id)
#  fk_rails_...  (tag_id => tags.id)
#
class HistoryTag < ApplicationRecord
  belongs_to :history
  belongs_to :tag

  validates :history_id, presence: true
  validates :tag_id, presence: true
end
