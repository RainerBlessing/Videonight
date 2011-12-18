class Vote < ActiveRecord::Base
  belongs_to :selection
  belongs_to :user
end
