# encoding : utf-8

FactoryGirl.define do
  factory :user_1st, class: User do
    id '111'
    username 'qhduc'
    password '18121990'
    email 'user.params@email.com'
    first_name 'quach'
    last_name 'huynh duc'
    avatar '/profiles/lat.png'
    birthday '28/08/1992'
    address '1234 abcd.'
  end

  factory :user_2nd, class: User do
    id '222'
    username 'qhduc 2'
    password '456789'
    email 'user.params@email.com'
    first_name 'quach'
    last_name 'huynh duc'
    avatar '/profiles/lat.png'
    birthday '28/08/1992'
    address '1234 abcd.'
  end

end