class User < ActiveRecord::Base
  attr_accessible :email, :password, :user_id, :admin, :password_confirmation, :first_name, :last_name
  validates_confirmation_of :password, :password_confirmation, :on => :create
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
  
  def self.authenticate(email, password)
       auth = nil
       user = find_by_email(email)
       # I heard something about hashing, dunno, why bother really. Nobody will get access to my stuff!
       if user
         if user.password == password
           auth = user
         else
          raise "Incorrect Password!"
         end 
       else
          raise "#{email} doesn't exist!"
       end
       return auth
  end
    
end
