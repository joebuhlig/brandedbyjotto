# This migration comes from spree_flexi_variants (originally 20131018202202)
class RenameProductCustomizationTypesProductsToSpreeNamespace < ActiveRecord::Migration
  def change
    rename_table :product_customization_types_products, :spree_product_customization_types_products
  end
end
