# encoding: utf-8
require 'spec_helper'

def find_and_destroy(class_entry, obj_entry)
  class_entry = class_entry.constantize
  if class_entry.find_by_id(obj_entry)
    class_entry.destroy(obj_entry)
  end
end

def hook_selenium
  require 'selenium-webdriver'

  before(:each) do
    # Config WebDriver fo selenium
    @driver = Selenium::WebDriver.for :firefox
  end

  # after(:each) do
  #   # quit browser after finish test
  #   @driver.quit
  # end

  User.where(email: 'user_test@email.com').destroy_all
end

def user_signup_login
  # Get url to sign up account in blog
  @driver.get 'http://localhost:3000/sign_up'
  # Fill account info to sign up
  @driver.find_element(name: 'user[email]').send_keys(FactoryGirl.attributes_for(:user_3th)[:email])
  @driver.find_element(name: 'user[username]').send_keys(FactoryGirl.attributes_for(:user_3th)[:username])
  @driver.find_element(name: 'user[password]').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  @driver.find_element(name: 'user[password_confirmation]').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  # Fill call action submit of form
  @driver.find_element(id: 'register_test').submit
  # App redirect to form log in
  # Fill password to log in
  @driver.find_element(name: 'password').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  # Call action submit of form
  @driver.find_element(id: 'login_test').submit
end

def fckeditor_fill_in(id, params = {})
    page.execute_script %Q{
      var ckeditor = CKEDITOR.instances.#{id}
      ckeditor.setData('#{params}')
      ckeditor.focus()
      ckeditor.updateElement()
    }
  end
