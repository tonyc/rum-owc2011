require 'spec_helper'

describe Recipient do

  def reset_recipient(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @recipient.destroy! if @recipient
    @recipient = Recipient.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_recipient
  end

  context "validations" do
    
    it "rejects empty name" do
      Recipient.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_recipient
      Recipient.new(@valid_attributes).should_not be_valid
    end
    
  end

end