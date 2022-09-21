class UsersController < ApplicationController
  def my_portofolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
  
  def friends
    @friends = current_user.friends  
  end
  
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
end
