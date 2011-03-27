class AddActiveToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :active, :boolean 
  end

  def self.down
    remove_column :campaigns, :active 
  end
end
