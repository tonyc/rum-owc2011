module Admin
  class CampaignsController < Admin::BaseController

    crudify :campaign,
            :title_attribute => 'name'

    def index
      search_all_campaigns if searching?
      paginate_all_campaigns

      render :partial => 'campaigns' if request.xhr?
    end

  end
end
