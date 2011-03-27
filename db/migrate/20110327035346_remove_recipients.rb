class RemoveRecipients < ActiveRecord::Migration
  def self.up
    drop_table :recipients
  end

  def self.down
    create_table :recipients do |t|
      t.timestamps
    end
  end
end
