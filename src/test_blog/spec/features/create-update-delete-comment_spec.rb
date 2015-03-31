# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up to create post' do
  # Define data to test
  let(:post_1st) { FactoryGirl.attributes_for(:post_1st) }

  let(:comment_3th) { FactoryGirl.attributes_for(:comment_3th) }
  let(:comment_4th) { FactoryGirl.attributes_for(:comment_4th) }

  let(:user_1st) { FactoryGirl.attributes_for(:user_1st) }
  let(:user_2nd) { FactoryGirl.attributes_for(:user_2nd) }

  hook_selenium


  it "first user sign up account and create one post" do
    user_sign_up(user_1st)
    user_log_in(user_1st)

    @driver.get config_init("host")
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
    sleep(inspection_time=5)
  end

  it "after that user 2nd sign up account and comment in user_1st's post" do
    user_sign_up(user_2nd)
    user_log_in(user_2nd)

    @driver.get config_init("host")+'/posts/'+post_1st[:id].to_s
    # Test with mode production
    @driver.find_element(name: 'comment[content]').send_keys(comment_3th[:content])
    @driver.find_element(:name, "comment_test").click
    # accept alert box
    @driver.switch_to.alert.accept
    sleep(inspection_time=5)
  end

  it "one day user 2nd log in to website and update info of him comment" do
    user_log_in(user_2nd)
    @driver.get config_init("host")+'/posts/'+post_1st[:id].to_s
    @driver.find_element(:name, "edit_comment_test").click

    @driver.find_element(name: 'comment[content]').send_keys(comment_4th[:content])

    @driver.find_element(:name, "edit_comment_accept").click
    # accept alert box
    @driver.switch_to.alert.accept
    sleep(inspection_time=5)
  end

  it "final user 2nd delete comment" do
    user_log_in(user_2nd)
    @driver.get 'http://localhost:3000/posts/'+post_1st[:id].to_s
    @driver.find_element(:name, "delete_comment_test").click
    @driver.switch_to.alert.accept
    sleep(inspection_time=5)
  end
end