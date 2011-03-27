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

    def update
     # if params[:applicant][:note].present? Note.new(:note, :applicant => Applicant.find(params[:applicant]))
      if @applicant.update_attributes(params[:applicant])
        flash[:success] = "Success"
        redirect_to applicants_path
      else
        flash[:alert] = "Failed to Update"
        render 'edit'
      end
    end
  end
end
