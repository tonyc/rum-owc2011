class CreateApplicants < ActiveRecord::Migration

  def self.up
    create_table :applicants do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :race
      t.string :dob
      t.string :weight
      t.string :height
      t.string :education
      t.string :military_service
      t.string :occupation
      t.string :guardian
      t.string :guardian_address
      t.string :guardian_city
      t.string :guardian_state
      t.string :guardian_zip
      t.string :guardian_phone
      t.text :matching_funds
      t.text :orgainized_fundraiser
      t.text :willing_participate
      t.integer :position

      t.timestamps
    end

    add_index :applicants, :id

    load(Rails.root.join('db', 'seeds', 'applicants.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "applicants"})

    Page.delete_all({:link_url => "/applicants"})

    drop_table :applicants
  end

end
