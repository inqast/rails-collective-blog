# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user
    @comment.save

    redirect_to post_path(@post)
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
