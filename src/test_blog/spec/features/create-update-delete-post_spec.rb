# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up create,update destroy post' do

  hook_selenium

  it "success" do
    user_signup_login

    @driver.get 'http://localhost:3000'
    # Test with mode production
    @driver.find_element(:id, "new_post_test").click
    @driver.find_element(name: 'post[title]').send_keys(FactoryGirl.attributes_for(:post_1st)[:title])
    @driver.find_element(name: 'post[description]').send_keys(FactoryGirl.attributes_for(:post_1st)[:description])
    # @driver.find_element(id: 'ckedit_content').send_keys(FactoryGirl.attributes_for(:post_1st)[:content])
    # check(@driver.find_element(name: 'post[status]'))
    @driver.find_element(:id, "create_post_test").click
    # Get url to logout
    # @driver.get 'http://localhost:3000/log_out'
  end

end