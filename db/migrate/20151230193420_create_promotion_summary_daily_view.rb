class CreatePromotionSummaryDailyView < ActiveRecord::Migration
  def self.up
	    execute <<-SQL
	    	CREATE VIEW promotion_daily_summaries AS
	    	SELECT o.updated_at::date, p.code, p.name, COUNT(o.id) as used,
SUM(CASE o.state WHEN 'complete' THEN 1 ELSE 0 END) as submitted
FROM spree_order_promotions op
LEFT JOIN spree_orders o ON op.order_id = o.id
LEFT JOIN spree_promotions p ON op.promotion_id = p.id
WHERE o.updated_at::date > '2015-11-24' OR o.completed_at IS NULL
GROUP BY o.updated_at::date, p.code, p.name
ORDER BY updated_at
	    SQL
	end

	def self.down
		execute "DROP VIEW promotion_daily_summaries"
	end
end
