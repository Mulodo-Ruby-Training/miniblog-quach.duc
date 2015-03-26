class HomeController < ApplicationController
  def index
    # DESC===========================
    # Get all of Post to show in view
    # OUT: all record of Post
    # DESC===========================
    @posts = Post.where('status = 1').page(params[:page]).per(4).order('updated_at DESC')
  end
end
