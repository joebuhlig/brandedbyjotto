Spree::Admin::ReportsController.class_eval do

	def initialize
		super 
		Spree::Admin::ReportsController.add_available_report!(:sales_total)
		Spree::Admin::ReportsController.add_available_report!(:product_summary)
		Spree::Admin::ReportsController.add_available_report!(:promotion_summary)
	end

	def product_summary
		params[:q] = {} unless params[:q]
		if params[:grouping].blank?
			params[:grouping] = "Daily"
		end

		if params[:q][:completed_at_eq].blank?
			params[:q][:completed_at_eq] = Time.zone.now.beginning_of_day
		else
			params[:q][:completed_at_eq] = Time.zone.parse(params[:q][:completed_at_eq]).beginning_of_day rescue Time.zone.now.beginning_of_day
		end
		if params[:selected_month].blank?
			params[:selected_month] = Time.zone.now.beginning_of_month
		else
			params[:selected_month] = Time.zone.parse(params[:selected_month]).beginning_of_month rescue Time.zone.now.beginning_of_month
		end
		if params[:selected_year].blank?
			params[:selected_year] = Time.zone.now.beginning_of_year
		else
			params[:selected_year] = Time.zone.parse(params[:selected_year]).beginning_of_year rescue Time.zone.now.beginning_of_year
		end

		if params[:grouping] == "Daily"
			@search = ProductDailySummary.ransack(params[:q])
		elsif params[:grouping] == "Monthly"
			params[:q][:completed_at_eq] = params[:selected_month]
			@search = ProductMonthlySummary.ransack(params[:q])
		elsif params[:grouping] == "Yearly"
			params[:q][:completed_at_eq] = params[:selected_year]
			@search = ProductYearlySummary.ransack(params[:q])
		end

		params[:q][:s] ||= "completed_at asc"

		@products = @search.result
    end

	def promotion_summary
		params[:q] = {} unless params[:q]
		if params[:grouping].blank?
			params[:grouping] = "Daily"
		end

		if params[:q][:updated_at_eq].blank?
			params[:q][:updated_at_eq] = Time.zone.now.beginning_of_day
		else
			params[:q][:updated_at_eq] = Time.zone.parse(params[:q][:updated_at_eq]).beginning_of_day rescue Time.zone.now.beginning_of_day
		end
		if params[:selected_month].blank?
			params[:selected_month] = Time.zone.now.beginning_of_month
		else
			params[:selected_month] = Time.zone.parse(params[:selected_month]).beginning_of_month rescue Time.zone.now.beginning_of_month
		end
		if params[:selected_year].blank?
			params[:selected_year] = Time.zone.now.beginning_of_year
		else
			params[:selected_year] = Time.zone.parse(params[:selected_year]).beginning_of_year rescue Time.zone.now.beginning_of_year
		end

		if params[:grouping] == "Daily"
			@search = PromotionDailySummary.ransack(params[:q])
		elsif params[:grouping] == "Monthly"
			params[:q][:updated_at_eq] = params[:selected_month]
			@search = PromotionMonthlySummary.ransack(params[:q])
		elsif params[:grouping] == "Yearly"
			params[:q][:updated_at_eq] = params[:selected_year]
			@search = PromotionYearlySummary.ransack(params[:q])
		end

		params[:q][:s] ||= "completed_at asc"

		@promotions = @search.result
    end
end