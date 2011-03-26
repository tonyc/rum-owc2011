module Admin
  class PaymentsController < Admin::BaseController

    crudify :payment,
            :title_attribute => 'transaction_id'

    def index
      search_all_payments if searching?
      paginate_all_payments

      render :partial => 'payments' if request.xhr?
    end

  end
end
