# This migration comes from spree_product_personalization (originally 20140906080343)
class AddIndexLineItemIdToLineItemPersonalizations < ActiveRecord::Migration
  def change
    add_index :spree_line_item_personalizations, :line_item_id
  end
end
