class Balance < ApplicationRecord
    after_validation :set_sum_amount
	belongs_to :user

	def set_sum_amount
      self.amount = self.amount.to_s.to_f + balance.to_s.to_f
   	end     
end
