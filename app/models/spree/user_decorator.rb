Spree::User.class_eval do

  before_create :mailchimp_add_to_mailing_list

  def mailchimp_add_to_mailing_list
  	api_key = Rails.application.secrets.MAILCHIMP_API_KEY
    gibbon = Gibbon::Request.new(api_key: api_key)
    list_id = Rails.application.secrets.MAILCHIMP_LIST_ID
    @signupresult = 'success'
    begin
    	gibbon.lists(list_id).members.create(body: {email_address: self.email, status: "subscribed", double_optin: false, send_welcome: false, merge_fields: {FNAME: "", LNAME: ""}})
    rescue Gibbon::MailChimpError => error
      if error.title
        if error.title = "Member Exists"
          @signupresult = "currentmember"
        end
      end
      logger.warn "SpreeMailChimp: Failed to create contact in Mailchimp"
    end

  end
end