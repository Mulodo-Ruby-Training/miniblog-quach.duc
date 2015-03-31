class Post < ActiveRecord::Base
  # has_and_belongs_to_many :categories
  has_many :comments
  belongs_to :user

  acts_as_taggable

  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :description, presence: true
  validates :description, length: { minimum: 50 }

  # validates :tag_list, :format => { :with => /^[A-Z][0-9]$/,
  #     :message => "Just too awesomezz" }

  # # validates :content, presence: true

  # validate :validate_tag

  # def validate_tag
  #   tag_list.each do |tag|
  #     # This will only accept two character alphanumeric entry such as A1, B2, C3. The alpha character has to precede the numeric.
  #     errors.add(:tag_list, "Please enter the code in the right format") unless tag =~ /^[A-Z][0-9]$/
  #   end
  # end
end
