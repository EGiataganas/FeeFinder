class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.admin?
  end

  def destroy

  	puts "DESTROY   !!!!!!"
  end
end