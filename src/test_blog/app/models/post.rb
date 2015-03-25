class Post < ActiveRecord::Base
  # has_and_belongs_to_many :categories
  has_many :comments
  belongs_to :user

  acts_as_taggable

  validates :title, presence: true

  validates :content, presence: true
end
