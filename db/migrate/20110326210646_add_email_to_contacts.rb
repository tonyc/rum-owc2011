class AddEmailToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :email_address, :string
  end

  def self.down
    remove_column :contacts, :email_address
  end
end
