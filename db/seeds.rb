# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_id = 1
topic_id = 1
Topic.create!(title: "code stuff", user_id: 1)
Bookmark.create!(topic_id: 7, user_id: 1, url: "geekwire.com")
Bookmark.create!(topic_id: 7, user_id: 1, url: "codecademy.com")
Bookmark.create!(topic_id: 7, user_id: 1, url: "udacity.com")
Bookmark.create!(topic_id: 7, user_id: 1, url: "bloc.io")
Bookmark.create!(topic_id: 7, user_id: 1, url: "leetcode.com")
