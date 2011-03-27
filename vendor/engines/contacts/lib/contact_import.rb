require 'csv'

class ContactImporter
  attr_accessor :expected_headers, :column_mappings

  def initialize
    @campaigns = {}
    @expected_headers = [
                         'Associated Rec/App',
                         'Last Name',
                         'First Name',
                         'Company',
                         'Address 1',
                         'Address 2',
                         'City',
                         'State',
                         'Zip Code',
                         'Donated FY10',
                         'Donated FY09',
                         'Donated FY08',
                         'Donated FY07',
                         'Donated FY06',
                         'Donated FY05',
                         'Donated FY04',
                         'Donated FY03',
                         'Donated FY02',
                         'Donated FY01'
                        ]
    @column_mappings = [
                        { :block => lambda do |value,c| 
                            if self.mappable_campaign_value(value)
                              c.campaigns << self.ensure_campaign(value)
                            end
                          end, :index => 0 },
                        { :property => :last_name, :index => 1 },
                        { :property => :first_name, :index => 2 },
                        { :property => :company, :index => 3 },
                        { :property => :address1, :index => 4 },
                        { :property => :address2, :index => 5 },
                        { :property => :city, :index => 6 },
                        { :property => :state, :index => 7 },
                        { :property => :zip, :index => 8 },
                        { :block => lambda { |value,c| c.add_donation_tag(2010) if value == "TRUE" }, :index => 9 },
                        { :block => lambda { |value,c| c.add_donation_tag(2009) if value == "TRUE" }, :index => 10 },
                        { :block => lambda { |value,c| c.add_donation_tag(2008) if value == "TRUE" }, :index => 11 },
                        { :block => lambda { |value,c| c.add_donation_tag(2007) if value == "TRUE" }, :index => 12 },
                        { :block => lambda { |value,c| c.add_donation_tag(2006) if value == "TRUE" }, :index => 13 },
                        { :block => lambda { |value,c| c.add_donation_tag(2005) if value == "TRUE" }, :index => 14 },
                        { :block => lambda { |value,c| c.add_donation_tag(2004) if value == "TRUE" }, :index => 15 },
                        { :block => lambda { |value,c| c.add_donation_tag(2003) if value == "TRUE" }, :index => 16 },
                        { :block => lambda { |value,c| c.add_donation_tag(2002) if value == "TRUE" }, :index => 17 },
                        { :block => lambda { |value,c| c.add_donation_tag(2001) if value == "TRUE" }, :index => 18 },
                       ]
  end

  def import(stream)
    contacts_added = []
    ActiveRecord::Base.transaction do
      csv = CSV::Reader.parse(stream) do |row|
        # Yes, this is gross.  Process expected_headers on first
        # iteration, then set it to nil to avoid further testing
        unless self.expected_headers.nil?
          unless row == self.expected_headers
            raise "CSV file in incorrect format.  Expecting the headers #{expected_headers.join(',')}, but got #{row.join(',')}"
          end
          self.expected_headers = nil
        else
          c = Contact.new
          self.column_mappings.each do |mapping|
            if mapping[:index]
              if mapping[:property]
                method_name = mapping[:property].to_s + "="
                c.send method_name, row[mapping[:index]]
              elsif mapping[:block]
                mapping[:block].call(row[mapping[:index]], c)
              end
              c.save
              contacts_added << c
            end
          end
        end
      end
      contacts_added
    end
  end

  def mappable_campaign_value(value)
    !value.nil? && value.length > 0
  end

  def ensure_campaign(name)
    c = Campaign.where('name=?', name).first
    if c.nil?
      c = Campaign.new
      c.name = name
      c.save
    end
    c
  end
end
