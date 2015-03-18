class HomeController < ApplicationController
  def index
    # DESC===========================
    # Get all of Post to show in view
    # OUT: all record of Post
    # DESC===========================
    @posts = Post.all.page(params[:page]).per(10).order('updated_at DESC')
  end
  def user_index
    # DESC===========================
    # Get all of User to show in view
    # OUT: all record of User
    # DESC===========================
    @users = User.all.page(params[:page]).per(10).order('updated_at DESC')
  end
end
