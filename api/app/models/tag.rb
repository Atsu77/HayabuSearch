class Tag < ApplicationRecord
  has_many :history_tags, through: :histories

  validates :tag_name, length: { maximum: 30 }
end
