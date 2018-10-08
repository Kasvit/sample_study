class UsersController < ApplicationController
  
  def index
    @users = User.all
    @users_count = User.count
  end

  def show
     @user = User.find(params[:id])
  end

end
