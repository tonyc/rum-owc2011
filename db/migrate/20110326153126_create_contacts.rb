class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :id
      t.string  :last_name
      t.string  :first_name
      t.string  :company
      t.string  :address1
      t.string  :address2
      t.string  :city
      t.string  :state
      t.string  :zip

      t.timestamps
    end
    create_table :donation_tags do |t|
      t.integer :contact_id
      t.integer :year
    end
  end

  def self.down
    drop_table :contacts
  end
end
