module Spree
	class Order < Spree::Base
	    def empty!
			line_items.destroy_all
			updater.update_item_count
			adjustments.destroy_all
			shipments.destroy_all
			state_changes.destroy_all
			promotions.destroy_all

			update_totals
			persist_totals
	    end
	end
end