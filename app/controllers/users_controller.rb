class UsersController < ApplicationController
  before_action :set_user, only: [ :update]
  before_action :user_validate, only: [ :update]
  
  helper SessionsHelper
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はrootにリダイレクト
      flash[:success] = "Edit Completed!"
      redirect_to root_path
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @following_users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @follower_users = @user.follower_users
  end
  
  def retweet
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :region, :email, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_validate
    if @user.id != current_user.id
      redirect_to root_path
    end
  end
end