class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save!
      redirect_to root_path
    end

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
