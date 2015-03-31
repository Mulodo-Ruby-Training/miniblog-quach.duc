# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up to create post' do
  # Define data to test
  let(:post_1st) { FactoryGirl.attributes_for(:post_1st) }
  let(:post_2nd) { FactoryGirl.attributes_for(:post_2nd) }

  let(:user_1st) { FactoryGirl.attributes_for(:user_1st) }

  hook_selenium


  it "success" do
    user_sign_up(user_1st)
    sleep(inspection_time=5)
    user_log_in(user_1st)
    sleep(inspection_time=5)

    @driver.get config_init("host")
    # Test with mode production
    @driver.find_element(:id, "new_post_test").click

    # FIXED:Failure/Error: @driver.find_element(name: 'post[title]').send_keys(FactoryGirl.attributes_for(:post_1st)[:title])
    #       Selenium::WebDriver::Error::StaleElementReferenceError:
    #       Element is no longer attached to the DOM
    hook_wait_post

    @driver.find_element(name: 'post[title]').send_keys(post_1st[:title])
    @driver.find_element(name: 'post[description]').send_keys(post_1st[:description])
    # @driver.find_element(id: 'ckedit_content').send_keys(FactoryGirl.attributes_for(:post_1st)[:content])
    # check(@driver.find_element(name: 'post[status]'))
    @driver.find_element(:name, "create_post_test").click
    # accept alert box
    @driver.switch_to.alert.accept
    sleep(inspection_time=5)
  end

  it "after that user want update info of this post" do
    user_log_in(user_1st)

    @driver.get config_init("host")

    @driver.find_element(:name, 'update_post_test_'+post_1st[:id].to_s).click

    hook_wait_post

    @driver.find_element(name: 'post[title]').send_keys(post_2nd[:title])
    @driver.find_element(name: 'post[description]').send_keys(post_2nd[:description])

    @driver.find_element(:name, 'edit_post_test').click

    sleep(inspection_time=5)
  end

  it "final user delete this post" do
    user_log_in(user_1st)

    @driver.get config_init("host")

    @driver.find_element(:name, 'delete_post_test_'+post_1st[:id].to_s).click
    @driver.switch_to.alert.accept
    sleep(inspection_time=5)
  end

end