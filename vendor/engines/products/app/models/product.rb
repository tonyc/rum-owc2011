class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description, :price]

  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true
  
  belongs_to :image
  
  scope :published,   where(:published => true)
  scope :unpublished, where(:published => false)
  
  def self.random
    ids = self.select(:id).published.all
    find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end
end
