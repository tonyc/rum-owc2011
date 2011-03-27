class AddFieldsToApplicant < ActiveRecord::Migration
  def self.up
    add_column :applicants, :personal_situation, :text
    add_column :applicants, :mobility_help, :text
    add_column :applicants, :willing_participate, :boolean
    add_column :applicants, :agree_terms, :boolean
  end

  def self.down
    remove_column :applicants, :agree_terms
    remove_column :applicants, :willing_participate
    remove_column :applicants, :mobility_help
    remove_column :applicants, :personal_situation
  end
end
