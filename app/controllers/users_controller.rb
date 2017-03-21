class UsersController < ApplicationController
  def add_friends
    @friends = User.all
    if params[:search]
      @friends = @friends.search(params[:search]).order("created_at DESC").all
    else
      @friends = User.all.order("created_at DESC")
    end
  end

  def show
    @friend = User.find(params[:id])
  end
end
