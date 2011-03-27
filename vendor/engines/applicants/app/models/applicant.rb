class Applicant < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  STATUSES = ['New Applicant', 'Declined', 'Follow-up Needed', 'Waiting on Documents', 'Wait Listed', 'Participating/Active Campaign', 'Completed']

  scope :isnewapp , where('status = ?', 'New Applicant')
  scope :isdeclined, where('status = ?', 'Declined' )
  scope :isfollowup, where('status = ?', 'Follow-up Needed' )
  scope :iswaiting, where('status = ?', 'Waiting on Documents' )
  scope :iswaitlisted, where('status = ?', 'Wait Listed' )
  scope :isactive, where('status = ?', 'Participating/Active Campaign' )
  scope :iscomplete, where('status = ?', 'Completed' )

  has_many :notes
  after_save :clean_notes
  has_one :campaign

  accepts_nested_attributes_for :notes

  acts_as_indexed :fields => [:name, :phone, :address, :city, :state, :zip, :email, :race, :dob, :weight, :height, :occupation, :guardian, :guardian_address, :guardian_city, :guardian_state, :guardian_zip, :guardian_phone]

  validates :name, :presence => true, :uniqueness => true

  validates_format_of :email,
                      :with => /^[A-Z0-9._%-]+@([A-z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be a valid email address"

  validates_acceptance_of :agree_terms, :message => "You must Agree to the Terms", :unless => :agree_terms

  def clean_notes
    for note in notes
      if note.comment.blank?
        note.destroy
      end
    end

  end

  def activate_campaign
    if self.campaign
      raise "Applicant '#{id}' already has campaign"
    else
      campaign = Campaign.new(:applicant => self, :name => self.name, :status => "new")
      return campaign.save
    end
  end

end
