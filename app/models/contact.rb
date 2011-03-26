class Contact < ActiveRecord::Base
  has_many :donation_tags
  has_and_belongs_to_many :campaigns
  def add_donation_tag(year)
    self.donation_tags = [] unless self.donation_tags
    dt = DonationTag.new
    dt.year = year
    self.donation_tags << dt
  end
end
