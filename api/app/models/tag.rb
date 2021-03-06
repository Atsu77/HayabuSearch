# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :history_tags, through: :histories

  validates :tag_name, length: { maximum: 30 }
end
