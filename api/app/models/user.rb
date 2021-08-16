# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGREX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGREX} 
end
