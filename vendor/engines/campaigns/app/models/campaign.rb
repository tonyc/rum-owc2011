class Campaign < ActiveRecord::Base

  scope :active, :conditions => ["active = true"], :order => "position ASC"
  acts_as_indexed :fields => [:name, :status]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :before_image_1, :class_name => 'Image'
  belongs_to :before_image_2, :class_name => 'Image'
  belongs_to :after_image_1, :class_name => 'Image'
  belongs_to :after_image_2, :class_name => 'Image'
  belongs_to :after_image_3, :class_name => 'Image'
  
  has_many :payments
  has_and_belongs_to_many :contacts

  def payment_total
    sum = 0.00 + 0.00
    #for self.payments.each do |payment|
    #    sum = sum + payment.amount
    #end
    payments.inject(0) { |sum, payment| sum = sum + payment.amount }
  end
  
end
