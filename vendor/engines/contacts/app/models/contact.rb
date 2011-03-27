class Contact < ActiveRecord::Base
  has_many :donation_tags
  has_and_belongs_to_many :campaigns
  acts_as_indexed :fields => [:last_name, :first_name, :company, :address1, :address2, :city, :state, :zip, :email_address]

  validates :last_name, :presence => true, :uniqueness => true

  def add_donation_tag(year)
    self.donation_tags = [] unless self.donation_tags
    dt = DonationTag.new
    dt.year = year
    self.donation_tags << dt
  end

  def best_name
    if self.last_name.nil? 
      self.company
    else
      "#{self.last_name}, #{self.first_name}"
    end
  end
end
