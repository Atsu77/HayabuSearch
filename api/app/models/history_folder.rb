class HistoryFolder < ApplicationRecord
  belongs_to :history
  belongs_to :folder
end

