class PaymentsController < ApplicationController

  before_filter :find_all_payments
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @payment in the line below:
    @recipients = Recipient.active
    present(@page)
  end

  def show
    @payment = Payment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @payment in the line below:
    present(@page)
  end

  def confirm
    @payment = Payment.new(
      :transaction_amount => params[:transactionAmount],
      :transaction_id     => params[:transactionId],
      :recipient => Recipient.find(params[:referenceId])
    )
    if @payment.save
      redirect_to(@payment, :notice => 'Payment was successfully created.')
    else
      redirect_to :action => "index"
    end
  end

protected

  def find_all_payments
    @payments = Payment.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/payments")
  end

end
