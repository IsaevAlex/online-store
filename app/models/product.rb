class Product < ApplicationRecord
	acts_as_votable
	has_many :comments
	belongs_to :type
	belongs_to :system_type
	belongs_to :category
	has_many :product_images
	belongs_to :model
	belongs_to :screen

	has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item

    scope :recent, ->{ order("created_at DESC") }
    scope :computers, ->{ joins(:category).where(["name = ?", "Компьютер"]) }
    scope :phones, ->{ joins(:category).where(["name = ?", "Телефон"]) }
	scope :price_ascending, ->{ order("price ASC") }

    # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
	def ensure_not_referenced_by_any_line_item
	    if line_items.empty?
	        return true
	    else
	        errors.add(:base, 'существуют товарные позиции')
	        return false
		end 
	end
end
