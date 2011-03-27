ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "mwagner72",
  :password             => "hotgeek2go",
  :authentication       => "plain",
  :enable_starttls_auto => true
}