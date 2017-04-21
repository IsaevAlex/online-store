class OrdersController < ApplicationController
  before_filter :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.user_id = current_user.id
    @order.total_amount = @cart.total_price
    if @order.user.balances.first.amount > @cart.total_price
      @order.user.balances.first.update(amount: @order.user.balances.first.amount.to_s.to_f - @cart.total_price) 
    else 
      flash[:error] = "У Вас недостаточно средств. Пополните счет"
      render 'new'
    end
    
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to orders_path
        flash[:notice] = "Ваш заказ оформлен"
      else
        flash[:error] = "Введите адрес"
        # @cart = current_cart
        render 'new'
      end
    
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      redirect_to root_path unless @order.user_id == current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :user_id)
    end
end
