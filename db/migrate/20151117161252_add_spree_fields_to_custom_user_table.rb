class AddSpreeFieldsToCustomUserTable < ActiveRecord::Migration
  def up
    add_column "refinery_authentication_devise_users", :spree_api_key, :string, :limit => 48
    add_column "refinery_authentication_devise_users", :ship_address_id, :integer
    add_column "refinery_authentication_devise_users", :bill_address_id, :integer
  end
end
