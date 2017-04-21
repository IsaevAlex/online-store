class BalancesController < ApplicationController
	before_filter :authenticate_user!

	before_action :find_balance, only: [:destroy, :edit, :update]
	
	def index
		@balances = current_user.balances
	end

	def new
		@balance = Balance.new
	end

	def create
		@balance = Balance.new(balance_params)
		@balance.user_id = current_user.id
		if @balance.save
			redirect_to balances_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @balance.update_attributes(balance_params)
			redirect_to balances_path
		else
			render 'edit'
		end
	end

	def destroy
		@balance.destroy
		redirect_to balances_path
	end

	private
		def find_balance
			@balance = Balance.find(params[:id])
		end
		def balance_params
			 params.require(:balance).permit(:amount, :user_id, :balance)
		end
end
