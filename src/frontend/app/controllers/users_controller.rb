class UsersController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
      redirect_to '/users/'+@user[:id].to_s, :flash => { :notice => "Update profile successfully"}
    else
      render :edit
    end
  end

  def index
    redirect_to sign_up_path
  end

private
def set_post
  @user = User.find(params[:id])
end
def user_params
  params.require(:user).permit(:email,:username,:first_name,:last_name,:address,:gender,:birthday, :password, :password_confirmation)
end
end

