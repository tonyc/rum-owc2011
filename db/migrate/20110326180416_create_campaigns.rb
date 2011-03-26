class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.float :target_level, :precision => 8, :scale => 2
      t.float :current_level, :precision => 8, :scale => 2
      t.integer :status
      t.timestamps
    end
    create_table :campaigns_contacts, :id => false do |t|
      t.integer :campaign_id
      t.integer :contact_id
    end
  end

  def self.down
    drop_table :campaign_contacts
    drop_table :campaigns
  end
end
