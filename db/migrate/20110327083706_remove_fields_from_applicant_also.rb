class RemoveFieldsFromApplicantAlso < ActiveRecord::Migration
  def self.up
    remove_column :applicants, :military_service
    remove_column :applicants, :education
  end

  def self.down
  end
end
