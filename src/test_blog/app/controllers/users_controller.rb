class UsersController < ApplicationController
  include ImagesUpload
  before_action :set_post, only: [:show, :edit, :update]

  def user_index
    # DESC===========================
    # Get all of User to show in view
    # OUT: all record of User
    # DESC===========================
    if params[:search_key]
      # Get list post with search key
      return @users = User.where('username LIKE :search_key OR first_name LIKE :search_key OR last_name LIKE :search_key',{ search_key: "%#{params[:search_key]}%" })
      # TEST SQL INJECTION
      # return @users = User.where('username LIKE ' + params[:search_key].to_s)
      # return @users = User.where('username LIKE ?',params[:search_key].to_s)
    end
    @users = User.all.page(params[:page]).per(8).order('updated_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Funtion upload image and validate
    validate_avatar
    if @user.save
      redirect_to log_in_path,:flash => { :notice => "Signed up success, can login to system !", :user_name => @user[:username] }
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      validate_avatar
      redirect_to '/users/'+@user[:id].to_s, :flash => { :notice => "Update profile successfully"}
    else
      render :edit and return
    end
  end


  def index
    redirect_to sign_up_path
  end


  def validate_avatar
    if avatar_params[:avatar]
      if ["image/svg","image/gif"].include?(avatar_params[:avatar].content_type.to_s)
        flash[:alert] = "File extention fail (svg,gif)"
        render :new and return
      elsif avatar_params[:avatar].size > 1000000
        flash[:alert] = "File size much be < 1MB"
        render :new and return
      else
        ImagesUpload.upload(@user, avatar_params, "avatar")
      end
    end
  end

private
def set_post
  @user = User.find(params[:id])
end

def avatar_params
  params.require(:user).permit(:avatar,:username)
end

def user_params
  params.require(:user).permit(:email,:username,:first_name,:last_name,:address,:gender,:birthday,:avatar, :password, :password_confirmation)
  # TEST STRONG PARAMETER
  # params.require(:user).permit(:email,:username,:last_name,:address,:gender,:birthday,:avatar, :password, :password_confirmation)
end
end

