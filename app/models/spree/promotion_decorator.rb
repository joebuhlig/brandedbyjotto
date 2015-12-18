Spree::Promotion.class_eval do
	def credits_closed
		Spree::Adjustment.eligible.promotion.where(source_id: actions.map(&:id), state: "closed")
	end

	def closed_count
		credits_closed.count
	end
end