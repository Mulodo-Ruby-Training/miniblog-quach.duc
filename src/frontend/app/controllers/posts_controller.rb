class PostsController < ApplicationController
   # Set funtions use partial funtion in private
   before_action :set_post, only: [:show, :edit, :update, :destroy]


  # TODO: pagging, bootstap, filter (Ex: status, use_id,..), partial and helper
  def index
    # DESC===========================
    # Get all of Post to show in view
    # OUT: all record of Post
    # DESC===========================
    if  params[:user_id]
      # Get all post of user
      @posts = User.find_by_id(params[:user_id]).posts.where('status = 1').page(params[:page]).per(8).order('updated_at DESC')
    else
      # Get all post
      @posts = Post.where('status = 1').page(params[:page]).per(8).order('updated_at DESC')
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
    if thumbnail_params[:thumbnail]
      if ["image/svg","image/gif"].include?(thumbnail_params[:thumbnail].content_type.to_s)
         flash[:alert] = "File extention fail (svg,gif)"
         format.js { render :action => "create_fail"}
      elsif thumbnail_params[:thumbnail].size > 1000000
         flash[:alert] = "File size much be < 1MB"
         format.js { render :action => "create_fail"}
      else
        ImagesUpload.upload(@post, thumbnail_params, "thumbnail")
      end
    end
      # Respond to js request
      respond_to do |format|
        #  if @post.save
        #   format.js { render :action => "create_ok"}
        # else
        #   format.js { render :action => "create_fail"}
        # end
        flash[:alert] = "Something went wrong !"
        @post.save ? format.js { render :action => "create_ok"} : format.js { render :action => "create_fail"}
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
  end

  def update
     respond_to do |format|
      if @post.update(post_params)
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
      respond_to do |format|
        format.html { redirect_to root_url, :flash => { :notice => "Delete post successfully" }}
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
        params.require(:post).permit(:title, :description, :content, :thumbnail, :status, :user_id)
    end
end
