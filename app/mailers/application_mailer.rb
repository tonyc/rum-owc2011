class ApplicationMailer < ActionMailer::Base
  default :from => "mobility-mariann@comcast.net"

  def application_confirmation(submitted_application)
    @submitted_application = submitted_application
    mail(:to => "#{submitted_application.name} <#{submitted_application.email}>", :subject => "Application Submitted")

  end

  def application_notification(submitted_application)
    @submitted_application = submitted_application
    mail(:to => "Mobility for Independence <mobility-mariann@comcast.net>", :subject => "Application Submitted")

  end

end
