class HistoryFolder < ApplicationRecord
  belongs_to :history
  belongs_to :folder

  validates :history_id, presence: true
  validates :folder_id, presence: true
end

