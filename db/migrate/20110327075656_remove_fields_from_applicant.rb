class RemoveFieldsFromApplicant < ActiveRecord::Migration
  def self.up
    remove_column :applicants, :matching_funds
    remove_column :applicants, :orgainized_fundraiser
    remove_column :applicants, :willing_participate
  end

  def self.down
  end
end
