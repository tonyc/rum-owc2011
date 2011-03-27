class Applicant < ActiveRecord::Base
  after_save :send_notifications

  acts_as_indexed :fields => [:name, :phone, :address, :city, :state, :zip, :email, :race, :dob, :weight, :height, :education, :military_service, :occupation, :guardian, :guardian_address, :guardian_city, :guardian_state, :guardian_zip, :guardian_phone, :matching_funds, :orgainized_fundraiser, :willing_participate]

  validates :name, :presence => true, :uniqueness => true

  validates_format_of :email,
                      :with => /^[A-Z0-9._%-]+@([A-z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be a valid email address"

  private

  def send_notifications
    ApplicationMailer::application_notification(self).deliver
    ApplicationMailer::application_confirmation(self).deliver
  end
end
