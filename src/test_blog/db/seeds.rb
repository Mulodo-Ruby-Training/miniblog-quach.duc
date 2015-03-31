# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CREATE DATABASE FOR POST TABLE
# DESC===========================
# t.string         :title
# t.string         :description
# t.text            :content
# t.string         :thumbnail
# t.integer       :user_id
# t.boolean      :status
# # DELETE=========================
Post.delete_all()
# like
# Rails console
# ActiveRecord::Base.connection.execute("DELETE from posts")
# CREAT==========================
# Creat 20 post
(1..20).each do |e|
  Post.create(  title: 'Ruby on Rails入門'+e.to_s,
                      description: 'Ruby on RailsはWebアプリケーション作成のためのフレームワークの一つであり、プログラミング言語としてRubyを使用するフレームワークの代表的なものです。ここではRailsを使ったアプリケーション作成の方法について順に解説を行ないます'+e.to_s,
                      content: '、プログラミング言語としてRubyを使用するフレームワークの代表的なものです。ここではRailsを使ったアプリケーション作成の方法について順に解説を行ないます アプリケーション作成から実行までの手順 Scaffoldを使ったアプリケーション雛形の作成 .....'+e.to_s,
                      thumbnail: 'thumbnail'+e.to_s,
                      user_id: e.to_s,
                      tag_list: 'ruby,rails,ruby_on_rails',
                      status: true)
end
# # ==============================

# CREATE DATABASE FOR USER TABLE
# DESC===========================
# t.string              :username
# t.string              :first_name
# t.string              :last_name
# t.string              :email
# t.string              :address
# t.string              :encrypt_pass
# t.string              :avatar
# t.boolean           :gender
# t.date                :birthday
# # DELETE=========================
User.delete_all()
# # like
# # Rails console
# # ActiveRecord::Base.connection.execute("DELETE from USERS")
# # CREAT==========================
(1..20).each do |e|
    User.create({  username: 'username'+e.to_s,
                          password: '12345',
                          email: 'user@email.com'+e.to_s,
                          first_name: 'first_name'+e.to_s,
                          last_name: 'last_name'+e.to_s,
                          avatar: 'avatar'+e.to_s,
                          birthday: '21-05-1992',
                          address: 'address'+e.to_s,
                          gender: true  })
end
# # ==============================

# CREATE DATABASE FOR USER TABLE
# DESC===========================
# t.string              :username
# t.string              :first_name
# t.string              :last_name
# t.string              :email
# t.string              :address
# t.string              :encrypt_pass
# t.string              :avatar
# t.boolean           :gender
# t.date                :birthday
# # DELETE=========================
Comment.delete_all()
# # like
# # Rails console
# # ActiveRecord::Base.connection.execute("DELETE from CommentS")
# # CREAT==========================
(1..20).each do |e|
    Comment.create({  user_id: e.to_s,
                                  post_id: e.to_s,
                                  content: 'Comment content'+e.to_s })
end
# # ==============================

