class ApplicantsController < ApplicationController

  before_filter :find_all_applicants
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @applicant in the line below:
    present(@page)
  end

  def show
    @applicant = Applicant.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @applicant in the line below:
    present(@page)
  end

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(params[:applicant])
    if @applicant.save
      flash[:success] = "Application Submitted"
      ApplicationMailer.application_notification(@applicant).deliver
      ApplicationMailer.application_confirmation(@applicant).deliver
      redirect_to applicants_path
    else 
      render 'new'
    end
  end
protected

  def find_all_applicants
    @applicants = Applicant.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/applicants")
  end

end
