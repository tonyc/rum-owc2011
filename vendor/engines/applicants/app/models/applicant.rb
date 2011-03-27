class Applicant < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :phone, :address, :city, :state, :zip, :email, :race, :dob, :weight, :height, :education, :military_service, :occupation, :guardian, :guardian_address, :guardian_city, :guardian_state, :guardian_zip, :guardian_phone, :matching_funds, :orgainized_fundraiser, :willing_participate]

  validates :name, :presence => true, :uniqueness => true
  
end
