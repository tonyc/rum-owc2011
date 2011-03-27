require 'spec_helper'

describe Contact do

  def reset_contact(options = {})
    @valid_attributes = {
      :id => 1,
      :last_name => "RSpec is great for testing too"
    }

    @contact.destroy! if @contact
    @contact = Contact.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_contact
  end

  context "validations" do
    
    it "rejects empty last_name" do
      Contact.new(@valid_attributes.merge(:last_name => "")).should_not be_valid
    end

    it "rejects non unique last_name" do
      # as one gets created before each spec by reset_contact
      Contact.new(@valid_attributes).should_not be_valid
    end
    
  end

end