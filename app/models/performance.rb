class Performance < ActiveRecord::Base
  attr_accessible :comments, :date_submitted, :reviewer, :score
  belongs_to :user  
  
  def reviewer_name
   User.find_by_id(self.reviewer).full_name
  end
end
