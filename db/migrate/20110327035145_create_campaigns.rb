class CreateCampaigns < ActiveRecord::Migration

  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.text :success_story
      t.string :year
      t.integer :before_image_1_id
      t.integer :before_image_2_id
      t.integer :after_image_1_id
      t.integer :after_image_2_id
      t.integer :after_image_3_id
      t.float :target_level
      t.string :status
      t.integer :position

      t.timestamps
    end

    add_index :campaigns, :id

    load(Rails.root.join('db', 'seeds', 'campaigns.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "campaigns"})

    Page.delete_all({:link_url => "/campaigns"})

    drop_table :campaigns
  end

end
