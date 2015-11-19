# This migration comes from spree_product_personalization (originally 20140901182553)
class CreateSpreeProductPersonalizations < ActiveRecord::Migration
  def change
    create_table :spree_product_personalizations do |t|
      t.integer  :product_id
      t.string   :name
      t.boolean  :required,           :default => false
      t.integer  :limit,              :default => 255
      t.timestamps
    end
  end
end
