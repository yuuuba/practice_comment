class PostsController < ApplicationController
  before_action :post_params, only: [:create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @user = current_user.id
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
      redirect_to :back
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
