class HomeController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10).order('updated_at DESC')
  end
end
