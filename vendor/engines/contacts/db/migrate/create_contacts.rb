class CreateContacts < ActiveRecord::Migration

  def self.up
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :email_address
      t.integer :position

      t.timestamps
    end

    create_table :donation_tags do |t|
      t.integer :contact_id
      t.integer :year
    end

    create_table :campaigns do |t|
      t.string :name
      t.float :target_level, :precision => 8, :scale => 2
      t.float :current_level, :precision => 8, :scale => 2
      t.integer :status
      t.timestamps
    end

    create_table :campaigns_contacts, :id => false do |t|
      t.integer :campaign_id
      t.integer :contact_id
    end

    add_index :contacts, :id

    load(Rails.root.join('db', 'seeds', 'contacts.rb'))
  end

  def self.down
    drop_table :campaigns_contacts
    drop_table :campaigns
    drop_table :donation_tags

    UserPlugin.destroy_all({:name => "contacts"})

    Page.delete_all({:link_url => "/contacts"})

    drop_table :contacts
  end

end
