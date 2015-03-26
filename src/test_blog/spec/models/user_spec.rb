# encoding: utf-8
require './spec/spec_base_helper.rb'

RSpec.describe User, type: :model do
  # define user_1st, user_2nd to use
  let(:user_1st) { FactoryGirl.attributes_for(:user_1st) }
  let(:user_2nd) { FactoryGirl.attributes_for(:user_2nd) }

  describe 'Create/edit/delete user' do

      # Test function create user in model
      # desc: count and compare number of all user
      it "when create user" do
        find_and_destroy("Post",user_1st[:id])
        @users_count = User.all.count
        @user = User.create(user_1st)
        expect(@users_count).to eq(User.all.count - 1)
      end

      it "when update user" do
        # Destroy user_2nd if exist
         find_and_destroy("Post",user_2nd[:id])
        @user = User.update(User.first[:id], user_2nd)
        expect(@user).to be_valid
      end

  end

  describe 'Check validation user' do
      # TODO: view bofore(:example), bofore(:context),...
      before do
        @user = User.create(user_1st)
      end

      context "check username" do
        it "when a username is not present" do
          @user.username = nil
          expect(@user).to be_invalid
        end
      end

      context "check email" do
        it "when a email is not present" do
          @user.email = nil
          expect(@user).to be_invalid
        end

        it "when an email address is already taken" do
          user_same_email = @user.dup
          user_same_email.email = @user.email.upcase
          user_same_email.save
        end
      end
  end

  # TODO
  # describe "Encrypt password" do
  # expect(@user[:password_hash]).to eq(BCrypt::Engine.hash_secret(@user[:password], @user[:password_salt]))
  # end
end