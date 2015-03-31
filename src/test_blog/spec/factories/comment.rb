# encoding: utf-8
FactoryGirl.define do

  factory :comment_1st, class: Comment do
    content 'content comment 1st'
    user_id 1
    post_id 2
  end

  factory :comment_2nd, class: Comment do
    content 'content comment 2nd'
    user_id 2
    post_id 1
  end

  factory :comment_3th, class: Comment do
    content 'content comment 3th'
  end

  factory :comment_4th, class: Comment do
    content 'content comment 4th'
  end

end