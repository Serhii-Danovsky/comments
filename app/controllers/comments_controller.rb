class CommentsController < ApplicationController
  def create
    @parent = Article.find(params[:article_id]) if params[:article_id]   
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]  
    @comment = @parent.comments.new(params[:comment])
    if @comment.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def new
    @parent_comment = Comment.find(params[:comment_id])     
    @comment = @parent_comment.comments.new 
  end

  def destroy
    @comment = Comment.find(params[:id])    
    @comment.destroy
    redirect_to articles_path
  end
end