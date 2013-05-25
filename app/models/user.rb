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
  attr_accessor :skip_user_id_assign
  before_save :assign_user_id, :on => :create
  has_one :retirement, :foreign_key => :user_id, :primary_key => :user_id
  has_one :paid_time_off, :foreign_key => :user_id, :primary_key => :user_id
  
  

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
    
  def assign_user_id
     unless @skip_user_id_assign.present? || self.user_id.present?
      user = User.order("user_id").last
      uid = user.user_id.to_i + 1 if user && user.user_id && !(User.exists?(:user_id => "#{user.user_id.to_i + 1}"))
      self.user_id = uid.to_s if uid
     end
  end

end
