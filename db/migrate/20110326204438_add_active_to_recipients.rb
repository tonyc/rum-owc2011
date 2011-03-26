class AddActiveToRecipients < ActiveRecord::Migration
  def self.up
    add_column :recipients, :active, :boolean 
  end

  def self.down
    remove_column :recipients, :active 
  end
end
