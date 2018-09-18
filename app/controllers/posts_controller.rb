class PostsController < ApplicationController
  
  before_action :require_login, only: [:edit, :update]
  
  def new
    @post = Post.new 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    @post.sub_id = params[:sub_id]
    if @post.save 
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end 
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_ids)
  end 
end
