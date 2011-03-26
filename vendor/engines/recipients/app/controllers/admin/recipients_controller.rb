module Admin
  class RecipientsController < Admin::BaseController

    crudify :recipient,
            :title_attribute => 'name'

    def index
      search_all_recipients if searching?
      paginate_all_recipients

      render :partial => 'recipients' if request.xhr?
    end

  end
end
