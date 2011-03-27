class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description, :price]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :image
end
