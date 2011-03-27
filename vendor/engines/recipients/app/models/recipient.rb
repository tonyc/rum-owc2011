class Recipient < ActiveRecord::Base
  scope :isactive, where('active = ?', true)
  
  acts_as_indexed :fields => [:name, :story, :year]

  validates :name, :presence => true, :uniqueness => true

  has_many :payments

  belongs_to :image
  
  scope :active, :conditions => ["active = true"], :order => "position ASC"

  def payment_total
    sum = 0.00 + 0.00
    #for self.payments.each do |payment|
    #    sum = sum + payment.amount
    #end
    payments.inject(0) { |sum, payment| sum = sum + payment.amount }
  end
end
