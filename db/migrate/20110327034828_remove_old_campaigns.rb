class RemoveOldCampaigns < ActiveRecord::Migration
  def self.up
    drop_table :campaigns
  end

  def self.down
    create_table :campaigns do |t|
      t.timestamps
    end
  end
end
