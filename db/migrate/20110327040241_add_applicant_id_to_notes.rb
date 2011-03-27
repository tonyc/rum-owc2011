class AddApplicantIdToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :applicant_id, :integer
  end

  def self.down
    remove_column :notes, :applicant_id
  end
end
