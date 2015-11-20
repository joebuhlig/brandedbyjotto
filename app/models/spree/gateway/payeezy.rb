module Spree
   class Gateway::Payeezy < Gateway
     preference :login, :string
     preference :password, :password


     def provider_class
       ActiveMerchant::Billing::Payeezy
     end
   end
end