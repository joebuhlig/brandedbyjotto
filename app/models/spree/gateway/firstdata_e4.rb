module Spree
   class Gateway::FirstdataE4 < Gateway
     preference :login, :string
     preference :password, :password


     def provider_class
       ActiveMerchant::Billing::FirstdataE4Gateway
     end
   end
end