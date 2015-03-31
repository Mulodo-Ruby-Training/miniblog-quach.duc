# encoding: utf-8

FactoryGirl.define do

  factory :post_1st, class: Post do
    id 1
    title 'title of post 1st lorem ipsum Voluptate in aliquip'
    description 'description post 1st Lorem ipsum Voluptate in aliquip in ullamco exercitation ullamco non ad aliqua qui aute pariatur dolore quis elit minim aliquip proident.'
    content 'content post 1st'
    thumbnail 'thumbnail_1st.png'
    user_id '2'
    status 0
  end

  factory :post_2nd, class: Post do
    id 2
    title 'title of post 2nd lorem ipsum Voluptate in aliquip'
    description 'description post 1st Lorem ipsum Voluptate in aliquip in ullamco exercitation ullamco non ad aliqua qui aute pariatur dolore quis elit minim aliquip proident.'
    content 'content post 2nd'
    thumbnail 'thumbnail_2nd.png'
    user_id '2'
    status 0
  end

end