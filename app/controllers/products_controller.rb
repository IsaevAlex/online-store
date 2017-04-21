class ProductsController < ApplicationController
	before_action :find_product, only: [:upvote, :downvote, :show]
	def index
		if params[:search]
			@products = Product.joins(:model).where(["name LIKE ?","%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 5)
			
		else
			@products = Product.joins(:category).paginate(:page => params[:page], :per_page => 5)
			
		end
		
	end

	def computers
		@products = Product.computers.paginate(:page => params[:page], :per_page => 5)
		render 'index'
	end

	def phones
		@products = Product.phones.paginate(:page => params[:page], :per_page => 5)
		render 'index'
	end

	def recent
  		@products = Product.recent.paginate(:page => params[:page], :per_page => 5)
  		render 'index'
  	end

  	def price_ascending
  		@products = Product.price_ascending.paginate(:page => params[:page], :per_page => 5)
  		
  		render "index"
  	end

	def upvote
    	@product.upvote_from current_user
    	respond_to do |format|
    		format.html { redirect_to :back }
    		format.js
    	end
  	end

  	def downvote
    	@product.downvote_from current_user
    	respond_to do |format|
    		format.html { redirect_to :back }
    		format.js
    	end
  	end

	def show
	end

	private

		def find_product
			@product = Product.find(params[:id])
		end
end
