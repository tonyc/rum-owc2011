class CreatePayments < ActiveRecord::Migration

  def self.up
    create_table :payments do |t|
      t.float :amount
      t.integer :recipient_id
      t.string :transaction_id
      t.integer :position

      t.timestamps
    end

    add_index :payments, :id

    load(Rails.root.join('db', 'seeds', 'payments.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "payments"})

    Page.delete_all({:link_url => "/payments"})

    drop_table :payments
  end

end
