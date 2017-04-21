class CommentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@comment = Comment.new
	    @comment = @product.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save
	end

	def destroy
		@product = Product.find(params[:product_id])
		@comment = @product.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
      		  format.js { flash.now[:success] = "Вы удалили отзыв" }
    	end
	end
end
