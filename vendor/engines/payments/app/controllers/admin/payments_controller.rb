module Admin
  class PaymentsController < Admin::BaseController
    before_filter :find_campaigns
    crudify :payment,
            :title_attribute => 'transaction_id'

    def index
      search_all_payments if searching?
      paginate_all_payments

      render :partial => 'payments' if request.xhr?
    end

    def new
      @payment = Payment.new
    end
    
    protected
    
    def find_campaigns
      @campaigns = Campaign.active
    end

    def contact_ajax
      @contacts = Contact.where('last_name LIKE ? )', "#{params[:q]}%", false)
    end
  end
end
