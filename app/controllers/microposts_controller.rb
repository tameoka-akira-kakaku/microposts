class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    if @micropost.destroy
      flash[:success] = "Micropost deleted!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end

  def retweet
    micropost = Micropost.find_by(id: params[:id])
    @micropost = Micropost.new(user_id: micropost.user.id, content: micropost.content, retweet_by: current_user.id)
    if @micropost.save
      flash[:success] = "Retweeted!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end
  
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end