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
# DELETE=========================
Post.delete_all()
# like
# Rails console
# ActiveRecord::Base.connection.execute("DELETE from posts")
# CREAT==========================
Post.create([
                      {title: 'Title 1', description: 'Decription 1', content: 'Content 1', thumbnail: 'thumbnail 1', user_id: '1', status: true },
                      {title: 'Title 2', description: 'Decription 2', content: 'Content 2', thumbnail: 'thumbnail 2', user_id: '1', status: true },
                      {title: 'Title 3', description: 'Decription 3', content: 'Content 3', thumbnail: 'thumbnail 3', user_id: '1', status: false },
                      {title: 'Title 3', description: 'Decription 4', content: 'Content 4', thumbnail: 'thumbnail 4', user_id: '1', status: false }
                 ])
# ==============================