module Spree
  class OrdersController < Spree::StoreController
  	def empty
	  	if @order = current_order
			@order.empty!
		end

		redirect_to spree.cart_path
  	end
  end
end