class CommentsController < ApplicationController
  def new
    #@post = Post.find(params[:id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new
    @user = current_user.id
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save!
      
    redirect_to post_path(@comment.post.id), notice: 'コメントしました'
    

  end

  def edit
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:post_id,:user_id)
  end
end
