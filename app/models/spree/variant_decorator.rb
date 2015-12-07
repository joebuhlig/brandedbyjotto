module Spree
	class Variant < Spree::Base
		def clean_options_text
			values = self.option_values.sort do |a, b|
				a.option_type.position <=> b.option_type.position
			end

		end
	end
end
