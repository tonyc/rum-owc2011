require 'spec_helper'

describe Applicant do

  def reset_applicant(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @applicant.destroy! if @applicant
    @applicant = Applicant.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_applicant
  end

  context "validations" do
    
    it "rejects empty name" do
      Applicant.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_applicant
      Applicant.new(@valid_attributes).should_not be_valid
    end
    
  end

end