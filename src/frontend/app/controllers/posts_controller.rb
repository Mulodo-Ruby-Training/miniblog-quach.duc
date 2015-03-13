class PostsController < ApplicationController
   # Set funtions use partial funtion in private
   before_action :set_post, only: [:show, :edit, :update, :destroy]


  # TODO: pagging, bootstap, filter (Ex: status, use_id,..), partial and helper
  def index
    # DESC===========================
    # Get all of Post to show in view
    # OUT: all record of Post
    # DESC===========================
    @posts = Post.all.reverse
  end

  def create
    # DESC===========================
    # Create record for Post
    # IN: post_params
    # OUT: create new record in database
    #         show record in view
    # DESC===========================
    @post = Post.new(post_params)
      # respond to js request
      respond_to do |format|
        #  if @post.save
        #   format.js { render :action => "create_ok"}
        # else
        #   format.js { render :action => "create_fail"}
        # end
        @post.save ? format.js { render :action => "create_ok"} : format.js { render :action => "create_fail"}
      end
  end

  def edit
    # DESC===========================
    # DESC===========================
  end

  def new
    # DESC===========================
    # Init new post for partial form
    # IN:
    # OUT: record empty for partial form
    # DESC===========================
    @post = Post.new
  end

  def show
  end

  def update
  end

  def destroy
    @post.destroy
      respond_to do |format|
      format.html { redirect_to posts_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      # DESC===========================
      # Partial for funtions use (edit, delete)
      # IN: params[:id]
      # OUT: post have this id
      # DESC===========================
      @post = Post.find(params[:id])
    end

    def post_params
        # DESC===========================
        # Filter params to get Post's param
        # IN: params
        # OUT: post_params
        # DESC===========================
        params.require(:post).permit(:title, :description, :content, :thumbnail, :status, :user_id)
    end
end
