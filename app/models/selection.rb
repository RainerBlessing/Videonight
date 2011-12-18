class Selection < ActiveRecord::Base
  belongs_to :event, :dependent => :destroy
  belongs_to :user
  belongs_to :movie
  has_many :votes

  def average_vote
    sum = 0
    votes.inject{ |sum,vote| sum + vote.value }
    votes.length>0 ? sum/votes.length : 0
  end
end
