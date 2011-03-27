class AddStatusToApplicant < ActiveRecord::Migration
  def self.up
    add_column :applicants, :status, :string
  end

  def self.down
    remove_column :applicants, :status
  end
end
