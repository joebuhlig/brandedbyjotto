class UpdateProductSummaryMonthlyView < ActiveRecord::Migration
	def self.up
		execute "DROP VIEW product_monthly_summaries"
	    execute <<-SQL
	    	CREATE VIEW product_monthly_summaries AS
	    	(SELECT date_trunc('month',o.completed_at) as completed_at, substring(v.sku from 1 for (char_length(v.sku) - 1)) as sku, 
p.name, MIN(pr.amount)::money as amount, SUM(li.quantity) as count, 
(MIN(pr.amount) * SUM(li.quantity) + sum(o.shipment_total / o.item_count::numeric))::money as sales,
SUM(o.adjustment_total / o.item_count)::money as discounts, 
((MIN(pr.amount) * SUM(li.quantity)) + SUM(o.adjustment_total / o.item_count))::money as total_sales,
MIN(0) as sort
FROM spree_orders o
LEFT JOIN spree_line_items li ON o.id = li.order_id
LEFT JOIN spree_variants v on li.variant_id = v.id
LEFT JOIN spree_prices pr on li.variant_id = pr.variant_id
LEFT JOIN spree_products p on v.product_id = p.id
WHERE state = 'complete' AND o.completed_at::date > '2015-11-24'
GROUP BY date_trunc('month',o.completed_at), substring(v.sku from 1 for (char_length(v.sku) - 1)), p.name)
UNION ALL
(SELECT date_trunc('month',o.completed_at) as completed_at, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END as sku, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'Cedar Box' WHEN 'W' THEN 'White Box' WHEN 'N' THEN 'No Box' END as name, 
MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END)::money as amount, SUM(li.quantity) as count, 
(MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END) * SUM(li.quantity))::money as sales,
MIN(0)::money as discounts, 
(MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END) * SUM(li.quantity))::money as total_sales,
MIN(1) as sort
FROM spree_orders o
LEFT JOIN spree_line_items li ON o.id = li.order_id
LEFT JOIN spree_variants v on li.variant_id = v.id
LEFT JOIN spree_prices pr on li.variant_id = pr.variant_id
LEFT JOIN spree_products p on v.product_id = p.id
WHERE state = 'complete' AND o.completed_at::date > '2015-11-24'
GROUP BY date_trunc('month',o.completed_at), 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'Cedar Box' WHEN 'W' THEN 'White Box' WHEN 'N' THEN 'No Box' END
ORDER BY date_trunc('month',o.completed_at), 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END)
ORDER BY completed_at, sort, sku
	    SQL
	end

	def self.down
		execute "DROP VIEW product_monthly_summaries"
	    execute <<-SQL
	    	CREATE VIEW product_monthly_summaries AS
	    	(SELECT date_trunc('month',o.completed_at) as completed_at, substring(v.sku from 1 for (char_length(v.sku) - 1)) as sku, 
p.name, MIN(pr.amount)::money as amount, SUM(li.quantity) as count, 
(MIN(pr.amount) * SUM(li.quantity))::money as sales,
SUM(o.adjustment_total / o.item_count)::money as discounts, 
((MIN(pr.amount) * SUM(li.quantity)) + SUM(o.adjustment_total / o.item_count))::money as total_sales,
MIN(0) as sort
FROM spree_orders o
LEFT JOIN spree_line_items li ON o.id = li.order_id
LEFT JOIN spree_variants v on li.variant_id = v.id
LEFT JOIN spree_prices pr on li.variant_id = pr.variant_id
LEFT JOIN spree_products p on v.product_id = p.id
WHERE state = 'complete' AND o.completed_at::date > '2015-11-24'
GROUP BY date_trunc('month',o.completed_at), substring(v.sku from 1 for (char_length(v.sku) - 1)), p.name)
UNION ALL
(SELECT date_trunc('month',o.completed_at) as completed_at, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END as sku, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'Cedar Box' WHEN 'W' THEN 'White Box' WHEN 'N' THEN 'No Box' END as name, 
MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END)::money as amount, SUM(li.quantity) as count, 
(MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END) * SUM(li.quantity))::money as sales,
MIN(0)::money as discounts, 
(MIN(CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 12 ELSE 0 END) * SUM(li.quantity))::money as total_sales,
MIN(1) as sort
FROM spree_orders o
LEFT JOIN spree_line_items li ON o.id = li.order_id
LEFT JOIN spree_variants v on li.variant_id = v.id
LEFT JOIN spree_prices pr on li.variant_id = pr.variant_id
LEFT JOIN spree_products p on v.product_id = p.id
WHERE state = 'complete' AND o.completed_at::date > '2015-11-24'
GROUP BY date_trunc('month',o.completed_at), 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END, 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'Cedar Box' WHEN 'W' THEN 'White Box' WHEN 'N' THEN 'No Box' END
ORDER BY date_trunc('month',o.completed_at), 
CASE substring(v.sku from char_length(v.sku) for char_length(v.sku)) WHEN 'C' THEN 'CEDARBOX' WHEN 'W' THEN 'WHITEBOX' WHEN 'N' THEN 'NOBOX' END)
ORDER BY completed_at, sort, sku
	    SQL
	end
end
