class Payment < ActiveRecord::Base

  acts_as_indexed :fields => [:transaction_id]

  validates :transaction_id, :presence => true, :uniqueness => true
  
end
