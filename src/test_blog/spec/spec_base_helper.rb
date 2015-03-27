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

  after(:each) do
    # quit browser after finish test
    @driver.quit
  end

end

def user_sign_up
  # Get url to sign up account in blog
  User.where(email: 'user_test@email.com').destroy_all
  @driver.get 'http://localhost:3000/sign_up'
  # Fill account info to sign up
  @driver.find_element(name: 'user[email]').send_keys(FactoryGirl.attributes_for(:user_3th)[:email])
  @driver.find_element(name: 'user[username]').send_keys(FactoryGirl.attributes_for(:user_3th)[:username])
  @driver.find_element(name: 'user[password]').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  @driver.find_element(name: 'user[password_confirmation]').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  # Fill call action submit of form
  @driver.find_element(name: 'register_test').submit
end

def user_log_in
  @driver.get 'http://localhost:3000/log_in'
  # Fill password to log in
  @driver.find_element(name: 'password').send_keys(FactoryGirl.attributes_for(:user_3th)[:password])
  @driver.find_element(name: 'username').send_keys(FactoryGirl.attributes_for(:user_3th)[:username])
  # Call action submit of form
  @driver.find_element(name: 'login_test').submit
end

# def fckeditor_fill_in(id, params = {})
#     page.execute_script %Q{
#       var ckeditor = CKEDITOR.instances.#{id}
#       ckeditor.setData('#{params}')
#       ckeditor.focus()
#       ckeditor.updateElement()
#     }
#   end
