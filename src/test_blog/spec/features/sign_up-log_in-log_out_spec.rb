# # encoding : utf-8
require './spec/spec_base_helper.rb'

describe 'User sign up account,log in with this account' do
  # Define user_1st to use
  let(:user_1st) { FactoryGirl.attributes_for(:user_1st) }

  hook_selenium

  it "success" do
    user_sign_up(user_1st)
    user_log_in(user_1st)
    # Get url to logout
    @driver.get 'http://localhost:3000/log_out'
  end

end

