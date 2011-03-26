class Payment < ActiveRecord::Base

  acts_as_indexed :fields => [:transaction_id]

  belongs_to :recipient
  
  validates :transaction_id, :presence => true, :uniqueness => true
  
end
