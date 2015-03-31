class PostsController < ApplicationController
    layout "layout_menu_right"
   # Set funtions use partial funtion in private
   before_action :set_post, only: [:show, :edit, :update, :destroy]



  # TODO: pagging, bootstap, filter (Ex: status, use_id,..), partial and helper
  def index
    # DESC===========================
    # Get all of Post to show in view
    # OUT: all record of Post
    # DESC===========================
    if params[:search_key]
      # Get list post with search key
      return @posts = Post.where('title LIKE :search_key OR description LIKE :search_key',{ search_key: "%#{params[:search_key]}%"})
    end

    if  params[:user_id]
      # Get all post of user
      return @posts = User.find_by_id(params[:user_id]).posts.page(params[:page]).per(8).order('updated_at DESC')
    end
      # Get all post
      @posts = Post.where('status = 1').page(params[:page]).per(8).order('updated_at DESC')
  end

  def tagged
    if params[:tag]
      @posts  = Post.tagged_with(params[:tag])
    end
  end

  def create

    @post = Post.new(post_params)
    # DESC===========================
    # Create record for Post
    # IN: post_params
    # OUT: create new record in database
    #         show record in view
    # DESC===========================
     validate_upload_file
      # Respond to js request
      respond_to do |format|
        #  if @post.save
        #   format.js { render :action => "create_ok"}
        # else
        #   format.js { render :action => "create_fail"}
        # end
        if @post.save
          format.js { render :action => "create_ok"}
        else
          flash[:alert] = ""
          for message in  @post.errors.full_messages
            flash[:alert] += message + " "
          end
          format.js { render :action => "create_fail"}
        end

      end
  end

  def edit
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
    # Get list comments of post and init @comment for for create comment
    # @post_comments = @post.comments.order('updated_at DESC')
    @post_comments = @post.comments
    @comment = Comment.new
    # @post_same_author = Post.where(user_id: @post.user_id).where('status = 1')
    @post_same_author = Post.where('user_id = :post_user_id AND status = 1 AND id != :post_id', {post_user_id: @post.user_id,post_id: @post.id})
  end

  def update
     respond_to do |format|
      if @post.update(post_params)
        validate_upload_file
        format.js { render :action => "create_ok"}
      else
        format.js { render :action => "create_fail"}
      end
    end
  end

  def destroy
    # DESC===========================
    # Destroy post
    # IN: post attr
    # OUT: delete this post in database
    # DESC===========================
    if @post[:thumbnail_path]
      FileUtils.remove_file(Rails.root.join('public','upload',@post[:thumbnail_path]))
    end
    @post.destroy
    redirect_to root_url, :flash => { :notice => "Delete post successfully" }
  end

  def validate_upload_file
    if thumbnail_params[:thumbnail]
      if ["image/svg", "image/gif"].include?(thumbnail_params[:thumbnail].content_type.to_s)
        flash[:alert] = "File extention fail (svg,gif)"
        format.js { render :action => "create_fail"}
      elsif thumbnail_params[:thumbnail].size > 1000000
        flash[:alert] = "File size much be < 1MB"
        format.js { render :action => "create_fail"}
      else
        ImagesUpload.upload(@post, thumbnail_params, "thumbnail")
      end
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

    def thumbnail_params
      params.require(:post).permit(:thumbnail)
    end


    def post_params
      # DESC===========================
      # Filter params to get Post's param
      # IN: params
      # OUT: post_params
      # DESC===========================
      params.require(:post).permit(:title, :description, :content, :thumbnail, :status, :user_id, :tag_list)
    end
end
