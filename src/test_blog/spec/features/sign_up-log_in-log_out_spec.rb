# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up account,log in with this account' do

  hook_selenium

  it "success" do
    user_signup_login
    # Get url to logout
    @driver.get 'http://localhost:3000/log_out'
  end

end

