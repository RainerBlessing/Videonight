class Selection < ActiveRecord::Base
  belongs_to :event, :dependent => :destroy
  belongs_to :user
  belongs_to :movie
  ajaxful_rateable :stars => 10, :dimensions => [:preference]
end
