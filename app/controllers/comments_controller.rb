class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id],product_id: params[:top_id])
    if @comment.destroy
      redirect_back(fallback_location: root_path, notice: '削除しました')
    else 
      redirect_back(fallback_location: root_path, notice: '削除失敗しました') 
    end 
  end


  private
  def comment_params
    params.require(:comment).permit(:comment,:product_id).merge(user_id: current_user.id, product_id: params[:top_id])
  end
end
