class Performance < ActiveRecord::Base
  attr_accessible :comments, :date_submitted, :reviewer, :score
  belongs_to :user

  def reviewer_name
   u = User.find_by_id(self.reviewer)
   u.full_name if u.respond_to?('fullname')
  end
end
