class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description, :price]

  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true
  
  belongs_to :image
  
  scope :published,   where(:published => true)
  scope :unpublished, where(:published => false)
end
