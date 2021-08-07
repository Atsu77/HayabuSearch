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
  user_image_url = "https://amazon.s3.image_#{i}"

  user = User.new(
    name: user_name,
    email: user_email,
    password: user_password,
    image_url: user_image_url,
  )

  # 各ユーザーごとの検索履歴を登録
  10.times do |j|
    history_url = "https://example.com/#{j}"
    history_title = "タイトル#{j}"

    user.histories.build(
      url: history_url,
      title: history_title
    )
  end

  user.save!

  Tag.create!(tag_name: 'Google')
  Tag.create!(tag_name: 'YouTube')
  Tag.create!(tag_name: 'Twitter')
  Tag.create!(tag_name: 'Qiita')
end