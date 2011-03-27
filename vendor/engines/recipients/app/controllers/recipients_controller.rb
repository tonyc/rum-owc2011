class RecipientsController < ApplicationController

  before_filter :find_all_recipients
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @recipient in the line below:
    present(@page)
  end

  def show
    @recipient = Recipient.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @recipient in the line below:
    present(@page)
  end

protected

  def find_all_recipients
    @recipients = Recipient.active
  end

  def find_page
    @page = Page.find_by_link_url("/recipients")
  end

end
