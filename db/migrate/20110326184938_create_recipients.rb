class CreateRecipients < ActiveRecord::Migration

  def self.up
    create_table :recipients do |t|
      t.string :name
      t.text :story
      t.string :year
      t.integer :image_id
      t.integer :amount_needed
      t.integer :amount_received
      t.integer :position

      t.timestamps
    end

    add_index :recipients, :id

    load(Rails.root.join('db', 'seeds', 'recipients.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "recipients"})

    Page.delete_all({:link_url => "/recipients"})

    drop_table :recipients
  end

end
