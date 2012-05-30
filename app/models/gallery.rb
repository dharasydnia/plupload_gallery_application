class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :images_attributes
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:img].blank? }, :allow_destroy => true
  
  validates :title, :presence => true
  validates :description, :presence => true

  ajaxful_rateable :dimensions => [:speed, :beauty, :price], :allow_update => true
end