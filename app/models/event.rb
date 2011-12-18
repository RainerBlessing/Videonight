class Event < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :movies, :through => :selections
  has_many :votes, :through => :selections

  accepts_nested_attributes_for :selections, :movies, :votes
end
