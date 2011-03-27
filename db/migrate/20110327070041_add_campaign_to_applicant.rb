class AddCampaignToApplicant < ActiveRecord::Migration

  def self.up
    add_column :campaigns, :applicant_id, :integer
  end

  def self.down
    remove_column :campaigns, :applicant_id, :integer
  end
end
