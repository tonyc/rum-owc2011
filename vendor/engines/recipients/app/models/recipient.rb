class Recipient < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :story, :year]

  validates :name, :presence => true, :uniqueness => true
<<<<<<< HEAD
  
=======
  has_many :payments
>>>>>>> update-payment-model
  belongs_to :image
end
