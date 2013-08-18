class User < ActiveRecord::Base
  attr_accessible :email, :password, :admin, :password_confirmation, :first_name, :last_name
  validates_confirmation_of :password, :password_confirmation, :on => :create
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create#,
                       #:format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\z/}
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
  attr_accessor :skip_user_id_assign
  before_save :assign_user_id, :on => :create
  before_save :hash_password
  has_one :retirement, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_one :paid_time_off, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_one :work_info, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_many :performance, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.authenticate(email, password)
       auth = nil
       user = find_by_email(email)
        raise "#{email} doesn't exist!" if !(user)
         if user.password == Digest::MD5.hexdigest(password)
           auth = user
         else
          raise "Incorrect Password!"
         end 
       return auth
  end  
   
=begin
  # More secure version, but still lacking a decent hashing routine
  def self.authenticate(email, password)
       user = find_by_email(email)
        if user and Rack::Utils.secure_compare(user.password, Digest::MD5.hexdigest(password))
          return user
        else
          raise "Incorrect username or password"
        end 
   end
=end   


    
  def assign_user_id
     unless @skip_user_id_assign.present? || self.user_id.present?
      user = User.order("user_id").last
      uid = user.user_id.to_i + 1 if user && user.user_id && !(User.exists?(:user_id => "#{user.user_id.to_i + 1}"))
      self.user_id = uid.to_s if uid
     end
  end
  
  def hash_password
    if self.password.present?
      self.password = Digest::MD5.hexdigest(password)
    end
  end

end
