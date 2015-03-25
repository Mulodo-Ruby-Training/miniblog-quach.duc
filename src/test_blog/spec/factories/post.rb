# encoding: utf-8

FactoryGirl.define do

  factory :post_1st, class: Post do
    title 'title of post 1st'
    description 'description post 1st'
    content 'content post 1st'
    thumbnail 'thumbnail_1st.png'
    user_id '2'
    status 0
  end

  factory :post_2nd, class: Post do
    title 'title of post 2nd'
    description 'description post 2nd'
    content 'content post 2nd'
    thumbnail 'thumbnail_2nd.png'
    user_id '2'
    status 0
  end

end