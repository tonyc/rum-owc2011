module Admin
  class ContactsController < Admin::BaseController

    crudify :contact, :title_attribute => 'last_name', :order => "last_name, company", :sortable => false


    def index
      logger.info "Whoa!  Am I searching? #{searching?}"
      search_all_contacts if searching?
      paginate_all_contacts

      render :partial => 'contacts' if request.xhr?
    end

    def import
    end

    protected

    def search_all_contacts
      arg = "%#{params[:search]}%"
      m = Contact.arel_table
      @contacts = Contact.where('last_name like ? OR first_name like ? OR company like ?', arg, arg, arg)
    end
  end
end
