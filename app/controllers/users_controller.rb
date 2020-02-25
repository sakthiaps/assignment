class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :follower, only: [:follow, :unfollow]

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    @followers = @user.followers
  end

  def follow
    respond_to do |format|
      if @follower.present?
        flash[:notice] = "Already following"
      else
        @follower = Follower.new(user_id: params[:user_id], associated_id: current_user.id)
        @follower.save
      end
      format.js {render inline: "location.reload();" }

    end
  end

  def unfollow
    respond_to do |format|
      if @follower.present?
        @follower.delete
      else
        flash[:notice] = "You are not following"
      end
      format.js {render inline: "location.reload();" }

    end
  end

  private

  def follower
    @follower = Follower.where(user_id: params[:user_id], associated_id: current_user.id).first
  end

end
