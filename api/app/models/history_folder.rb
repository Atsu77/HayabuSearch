# == Schema Information
#
# Table name: history_folders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  folder_id  :bigint           not null
#  history_id :bigint           not null
#
# Indexes
#
#  index_history_folders_on_folder_id   (folder_id)
#  index_history_folders_on_history_id  (history_id)
#
# Foreign Keys
#
#  fk_rails_...  (folder_id => folders.id)
#  fk_rails_...  (history_id => histories.id)
#
class HistoryFolder < ApplicationRecord
  belongs_to :history
  belongs_to :folder

  validates :history_id, presence: true
  validates :folder_id, presence: true
end

