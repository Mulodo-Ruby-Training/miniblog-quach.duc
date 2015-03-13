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
# Post.delete_all()
# # like
# # Rails console
# # ActiveRecord::Base.connection.execute("DELETE from posts")
# # CREAT==========================
# Post.create([
#                       {title: 'Title 1', description: 'Decription 1', content: 'Content 1', thumbnail: 'thumbnail 1', user_id: '1', status: true },
#                       {title: 'Title 2', description: 'Decription 2', content: 'Content 2', thumbnail: 'thumbnail 2', user_id: '1', status: true },
#                       {title: 'Title 3', description: 'Decription 3', content: 'Content 3', thumbnail: 'thumbnail 3', user_id: '1', status: false },
#                       {title: 'Title 3', description: 'Decription 4', content: 'Content 4', thumbnail: 'thumbnail 4', user_id: '1', status: false }
#                  ])
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
# DELETE=========================
User.delete_all()
# like
# Rails console
# ActiveRecord::Base.connection.execute("DELETE from USERS")
# CREAT==========================
User.create([
                    {username: 'username 1', first_name: 'first_name 1', last_name: 'last_name 1', email: 'email 1', address: 'address 1', encrypt_pass: 'encrypt_pass 1', avatar: 'avatar 1', gender: true , birthday: '21-05-1992' },
                    {username: 'username 2', first_name: 'first_name 2', last_name: 'last_name 2', email: 'email 2', address: 'address 2', encrypt_pass: 'encrypt_pass 2', avatar: 'avatar 2', gender: false , birthday: '21-05-1993' },
                    {username: 'username 3', first_name: 'first_name 3', last_name: 'last_name 3', email: 'email 3', address: 'address 3', encrypt_pass: 'encrypt_pass 3', avatar: 'avatar 3', gender: false , birthday: '21-06-1992' },
                    {username: 'username 4', first_name: 'first_name 4', last_name: 'last_name 4', email: 'email 4', address: 'address 4', encrypt_pass: 'encrypt_pass 4', avatar: 'avatar 4', gender: true , birthday: '21-05-1990' }
                 ])
# ==============================

* Changed something
  - [x] Add CKEDITOR in feature create,edit Post
  - [x] Create partial list_user and list_post (Using in many view)
  - [x] Init database simple for table User
  - [ ] List Frameworks
* Get list all user
  - [x]  Implement function get all user (have current user)
