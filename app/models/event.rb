class Event < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :movies, :through => :selections

  accepts_nested_attributes_for :selections, :movies, :allow_destroy => true
  
  def sorted_selections
    selections.sort!{|a,b| -(a.rate_average(false,:preference) <=> b.rate_average(false,:preference))}
  end
end
