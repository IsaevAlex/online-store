class Search < ApplicationRecord
	def products
		@products ||= find_products
	end

	private
		def find_products
			products = Product.order(:cached_votes_up => :desc)
			products = products.where(category_id: category_id) if category_id.present?
			products = products.where(type_id: type_id) if type_id.present?
			products = products.where(system_type_id: system_type_id) if system_type_id.present?
			products = products.where(screen_id: screen_id) if screen_id.present?
			products = products.where("price >= ?", min_price) if min_price.present?
			products = products.where(garant: true) if garant.present?
			products = products.where(on_sale: true) if on_sale.present?
			products = products.where("price <= ?", max_price) if max_price.present?
			products = products.where("memory >= ?", min_memory) if min_memory.present?
			products = products.where("memory <= ?", max_memory) if max_memory.present?
			products = products.where("ram >= ?", min_ram) if min_ram.present?
			products = products.where("ram <= ?", max_ram) if max_ram.present?
			products = products.where("battery_charge >= ?", min_battery_charge) if min_battery_charge.present?
			products = products.where("battery_charge <= ?", max_battery_charge) if max_battery_charge.present?						
			products
		end
end
