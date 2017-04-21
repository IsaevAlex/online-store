class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private

	def search_params
		params.require(:search).permit(:min_price, :max_price, :model_id, :category_id, :type_id, :system_type_id, :screen_id, :min_memory, :max_memory, :min_ram, :max_ram, :min_battery_charge, :max_battery_charge, :garant, :on_sale)
	end
end
