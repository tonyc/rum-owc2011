require 'spec_helper'

describe Campaign do

  def reset_campaign(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @campaign.destroy! if @campaign
    @campaign = Campaign.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_campaign
  end

  context "validations" do
    
    it "rejects empty name" do
      Campaign.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_campaign
      Campaign.new(@valid_attributes).should_not be_valid
    end
    
  end

end