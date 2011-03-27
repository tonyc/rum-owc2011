module PayNowWidgetUtils
  def generate_signed_form(access_key, aws_secret_key, form_params)
    sandbox = '-sandbox' unless Rails.env.production?
    form_params['accessKey'] = access_key
    
    # lexicographically sort the form parameters # and create the canonicalized string
    str_to_sign = ""
    form_params.keys.sort.each { |k| str_to_sign += "#{k}#{form_params[k]}" }
    
    # calculate signature of the above string 
    digest = OpenSSL::Digest::Digest.new('sha1') 
    hmac = OpenSSL::HMAC.digest(digest, aws_secret_key, str_to_sign) 
    form_params['signature'] = Base64.encode64(hmac).chomp
    
    # construct the form 
    signed_form = <<-STARTFORM
      <form action="https://authorize.payments#{sandbox}.amazon.com/pba/paypipeline" method="post">
    STARTFORM
    
    form_params.each do |key, value|
      next unless key and value
      signed_form += 
      <<-FORMELEM
          <input type="hidden" name="#{key}" value="#{value}" />
      FORMELEM
    end
    
    signed_form +=<<-ENDFORM
        <input type="image" src="https://authorize.payments#{sandbox}.amazon.com/pba/images/amazonPaymentsButton.jpg" border="0" >
      </form>
    ENDFORM
    
    signed_form
  end
end
