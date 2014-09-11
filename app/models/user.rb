require 'encryption'

class User < ActiveRecord::Base
  attr_accessible :email, :admin, :first_name, :last_name, :user_id, :password, :password_confirmation
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create,
                       :if => :password
=begin
  validates :password, :presence => true,
                        :confirmation => true,
                        :if => :password,
                        :format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\z/}
=end
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
  attr_accessor :skip_user_id_assign
  attr_accessor :skip_hash_password
  before_save :assign_user_id, :on => :create
  before_save :hash_password
  has_one :retirement, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_one :paid_time_off, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_one :work_info, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_many :performance, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  has_many :messages, :foreign_key => :receiver_id, :primary_key => :user_id, :dependent => :destroy
  has_many :pay, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  before_create { generate_token(:auth_token) }

  def build_benefits_data
    build_retirement(POPULATE_RETIREMENTS.shuffle.first)
    build_paid_time_off(POPULATE_PAID_TIME_OFF.shuffle.first).schedule.build(POPULATE_SCHEDULE.shuffle.first)
    build_work_info(POPULATE_WORK_INFO.shuffle.first)
    # Uncomment below line to use encrypted SSN(s)
    #work_info.build_key_management(:iv => SecureRandom.hex(32))
    performance.build(POPULATE_PERFORMANCE.shuffle.first)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

=begin
  # Instead of the entire user object being returned, we can use this to filter.
  def as_json
    super(only: [:user_id, :email, :first_name, :last_name])
  end
=end

  private

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
  # More secure version, still lacking a decent hashing routine, this is for timing attack prevention
  def self.authenticate(email, password)
       user = find_by_email(email) || User.new(:password => "")
        if Rack::Utils.secure_compare(user.password, Digest::MD5.hexdigest(password))
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
    unless @skip_hash_password == true
      if password.present?
        self.password = Digest::MD5.hexdigest(password)
      end
    end
  end

  def generate_token(column)
    begin
      self[column] = Encryption.encrypt_sensitive_value(self.user_id)
    end while User.exists?(column => self[column])
  end
end
