Spree::HomeController.class_eval do
	before_filter :home_check
	def home_check
		@home_check = true
	end
end