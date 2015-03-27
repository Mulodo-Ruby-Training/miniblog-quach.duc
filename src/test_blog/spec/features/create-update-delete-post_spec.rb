# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up to create post' do
  let(:post_1st) { FactoryGirl.attributes_for(:post_1st) }
  let(:post_2nd) { FactoryGirl.attributes_for(:post_2nd) }

  hook_selenium


  it "success" do
    user_sign_up
    user_log_in

    @driver.get 'http://localhost:3000'
    # Test with mode production
    @driver.find_element(:id, "new_post_test").click

    # FIXED:Failure/Error: @driver.find_element(name: 'post[title]').send_keys(FactoryGirl.attributes_for(:post_1st)[:title])
    #       Selenium::WebDriver::Error::StaleElementReferenceError:
    #       Element is no longer attached to the DOM

    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    wait.until { @driver.find_element(:name => "post[title]") }

    @driver.find_element(name: 'post[title]').send_keys(post_1st[:title])
    @driver.find_element(name: 'post[description]').send_keys(post_1st[:description])
    # @driver.find_element(id: 'ckedit_content').send_keys(FactoryGirl.attributes_for(:post_1st)[:content])
    # check(@driver.find_element(name: 'post[status]'))
    @driver.find_element(:name, "create_post_test").click
    # accept alert box
    @driver.switch_to.alert.accept
  end

  it "after that user want update info post" do
    user_log_in
    @driver.get 'http://localhost:3000'

    @driver.find_element(:name, 'update_post_test_'+post_1st[:id].to_s).click

    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    wait.until { @driver.find_element(:name => "post[title]") }

    @driver.find_element(name: 'post[title]').send_keys(post_2nd[:title])
    @driver.find_element(name: 'post[description]').send_keys(post_2nd[:description])

    @driver.find_element(:name, 'edit_post_test').click

    @driver.switch_to.alert.accept
  end

  it "final user delete post" do
    user_log_in
    @driver.get 'http://localhost:3000'

    @driver.find_element(:name, 'delete_post_test_'+post_1st[:id].to_s).click
    @driver.switch_to.alert.accept
  end

end