module Admin
  class ApplicantsController < Admin::BaseController

    crudify :applicant,
            :title_attribute => 'name'

    def index
      search_all_applicants if searching?
      paginate_all_applicants

      render :partial => 'applicants' if request.xhr?
    end

    def edit
      @applicant = Applicant.find(params[:id])
      @statuses = Applicant::STATUSES
      @note = @applicant.notes.build()
    end

    def new
      @applicant = Applicant.new
      @statuses = Applicant::STATUSES
    end

    def activate_campaign
      @applicant = Applicant.find(params[:id])
      if @applicant.activate_campaign
        flash[:success] = "Campaign Activated"
        redirect_to admin_applicants_path
      else
        flash[:alert] = "Failed to Activate Campaign"
        redirect_to admin_applicants_path
      end

    end

    def create
      @applicant = Applicant.new(params[:applicant])
      if @applicant.save
        flash[:success] = "Success"
        redirect_to admin_applicants_path
      else
        flash[:alert] = "Failed to Update"
        @statuses = Applicant::STATUSES
        render 'new'
      end
    end

    def update
      if @applicant.update_attributes(params[:applicant])
        flash[:success] = "Success"
        redirect_to admin_applicants_path
      else
        flash[:alert] = "Failed to Update"
        render 'edit'
      end
    end
  end
end
