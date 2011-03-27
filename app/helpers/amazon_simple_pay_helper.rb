module AmazonSimplePayHelper
  include PayNowWidgetUtils

  AMAZON_ACCESS_KEY = '11SEM03K88SD016FS1G2'
  AMAZON_SECRET_KEY = 'rYVa55uqbFzkQ2lAmvlgu3QWAI/NqFNHlYgtcoOT'

  AMAZON_PAYMENTS_ACCOUNT_ID = 'LANXUDYREFMM4I6XBM8Q61I7DVSMAVRXEVBR4P'
  
  def signed_amazon_simple_pay_button(amount, description, ref_id)
    output = ActiveSupport::SafeBuffer.new
    
    output.safe_concat(generate_signed_form(AMAZON_ACCESS_KEY,
                         AMAZON_SECRET_KEY,
                         'amazonPaymentsAccountId' => AMAZON_PAYMENTS_ACCOUNT_ID,
                         'amount'                  => "USD #{amount}",
                         'description'             => description,
                         'referenceId'             => ref_id,
                         'returnUrl'               => product_confirmation_url,
                         'abandonUrl'              => 'http://www.mobilityforindependence.org'))
  end
  
  def amazon_simple_pay_form_tag(options = {}, &block)
    sandbox = '-sandbox' unless Rails.env.production?
    pipeline_url = "https://authorize.payments#{sandbox}.amazon.com/pba/paypipeline"
    html_options = { :action => pipeline_url, :method => :post }.merge(options)
    content = capture(&block)
    output = ActiveSupport::SafeBuffer.new
    output.safe_concat(tag(:form, html_options, true))
    output << content
    output.safe_concat(hidden_field_tag('accessKey', AMAZON_ACCESS_KEY))
    output.safe_concat(hidden_field_tag('amazonPaymentsAccountId', AMAZON_PAYMENTS_ACCOUNT_ID))
    output.safe_concat(hidden_field_tag('immediateReturn', '1'))
    output.safe_concat(hidden_field_tag('processImmediate', '1'))
    output.safe_concat(hidden_field_tag('cobrandingStyle', 'logo'))
    output.safe_concat(hidden_field_tag('returnUrl', confirmation_url))
    
    output.safe_concat(hidden_field_tag('collectShippingAddress', '1')) if options[:collect_shipping_address]
    output.safe_concat("</form>")
  end

end
