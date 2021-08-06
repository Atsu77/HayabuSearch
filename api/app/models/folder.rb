class Folder < ApplicationRecord
  belongs_to :user
  has_many :history_folders, through: :histories

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
