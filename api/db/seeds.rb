# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'gimei'

# 50人のユーザーを登録
50.times do |i|
  user_name = Gimei.name.kanji
  user_email = Faker::Internet.email 
  user_password = 'password'

  user = User.new(
    name: user_name,
    email: user_email,
    password: user_password,
  )

  user.save!

end