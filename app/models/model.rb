class Model < ApplicationRecord
	has_many :products
	belongs_to :producer
	validates :name, presence: true
end
