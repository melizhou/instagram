class CommentsController < ApplicationController
	
	def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end
	
	 def destroy
   @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end	

  def edit
  	@photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
  end

  def update
  	@photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to photo_path(@photo)
    else 
      render 'edit'
    end
  end


private
def comment_params
	params.require(:comment).permit(:body)
end



end 