# This migration comes from spree_product_personalization (originally 20140906080317)
class AddIndexProductIdToProductPersonalizations < ActiveRecord::Migration
  def change
    add_index :spree_product_personalizations, :product_id
  end
end
