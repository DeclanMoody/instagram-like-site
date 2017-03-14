class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def index
    @post = Post.all.order("created_at DESC")
    @nil = "nil"
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(permit_post)
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def delete
    @delete = Post.delete_all
  end

  private
  def permit_post
    params.require(:post).permit(:image, :description)
  end
end
