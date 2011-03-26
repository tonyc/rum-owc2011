class Recipient < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :story, :year]

  validates :name, :presence => true, :uniqueness => true

  has_many :payments

  belongs_to :image
end
