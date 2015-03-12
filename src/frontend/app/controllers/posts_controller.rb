class PostsController < ApplicationController
  def index
    # DESC===========================
    # Get all of Post to show in view
    # TODO: pagging
    #            bootstap
    #            filter (Ex: status, use_id,..)
    #            partial and helper
    # DESC===========================
    @posts = Post.all
  end
end
