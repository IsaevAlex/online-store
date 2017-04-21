class Order < ApplicationRecord
	# after_validation :set_sum_after_order	
	has_many :line_items, dependent: :destroy
	belongs_to :user
	PAYMENT_TYPES = [ "Яндекс.Деньги", "Кредитная карта", "QIWI кошелек" ]
	validates :name, :address, :email, presence: true 
	

	def add_line_items_from_cart(cart)
         cart.line_items.each do |item|
             item.cart_id = nil
             line_items << item
         end
	end

	
	

	def set_sum_after_order
      self.user.balances.first.amount = self.user.balances.first.amount.to_s.to_f - 20000
   	end     

	def total_price
     	line_items.to_a.sum { |item| item.total_price }
	end		
end
