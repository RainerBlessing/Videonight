class Selection < ActiveRecord::Base
  belongs_to :event
  belongs_to :movie, :dependent => :destroy
  ajaxful_rateable :stars => 10, :dimensions => [:preference]
end
