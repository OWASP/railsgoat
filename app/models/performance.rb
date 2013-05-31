class Performance < ActiveRecord::Base
  attr_accessible :comments, :date_submitted, :reviewer, :score
  belongs_to :user  
end
