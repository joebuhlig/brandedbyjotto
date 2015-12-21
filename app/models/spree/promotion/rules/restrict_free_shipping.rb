module Spree
  class Promotion
    module Rules
      class RestrictFreeShipping < Spree::PromotionRule
   
        def applicable?(promotable)
          promotable.is_a?(Spree::Shipment)
        end

        def eligible?(order, options={})
          e = false
          if order.shipping_method.id == 1
            e = true
          else
            e = false
          end
          return e
        end

      end
    end
  end
end