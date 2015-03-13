class UsersController < ApplicationController
  def index
    # DESC===========================
    # Get all of User to show in view
    # OUT: all record of User
    # DESC===========================
    @users = User.all.reverse
  end
end
