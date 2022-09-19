class UsersController < ApplicationController
  def my_portofolio
    @tracked_stocks = current_user.stocks
  end
end
