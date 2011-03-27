class MovePaymentRecipientsToCampaigns < ActiveRecord::Migration
  def self.up
    rename_column :payments, :recipient_id, :campaign_id
  end

  def self.down
    rename_column :payments, :campaign_id, :recipient_id
  end
end
