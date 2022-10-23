class PostsController < ApplicationController
  before_action :post_params, only: [:create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      body: params[:post][:body],
      user_id: current_user.id
    )

    if @post.save!
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:user_id)
  end
end
