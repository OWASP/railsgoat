class WorkInfo < ActiveRecord::Base
  attr_accessible :DoB, :SSN, :bonuses, :income, :years_worked
  belongs_to :user
  has_one :key_management, :foreign_key => :user_id, :primary_key => :user_id, :dependent => :destroy
  before_save :encrypt_ssn
 
  
  # We should probably use this
  def last_four
    "***-**-" << self.SSN[-4,4]
  end
  
  def encrypt_ssn
     aes = OpenSSL::Cipher::Cipher.new(cipher_type)
     aes.encrypt
     aes.key = key
     aes.iv = iv if iv != nil
     self.encrypted_ssn = aes.update(self.SSN) + aes.final
     self.SSN = nil
  end
  
  def decrypt_ssn
     aes = OpenSSL::Cipher::Cipher.new(cipher_type)
     aes.decrypt
     aes.key = key
     aes.iv = iv if iv != nil
     aes.update(self.encrypted_ssn) + aes.final
  end
  
  def key
    raise "Key Missing" if !(KEY)
    KEY
  end
  
  def iv
    "asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf"
    #self.key_management.iv
    #raise "No IV for this User" if !(key_management.iv)
  end
  
  def cipher_type
    'aes-256-cbc'
  end
  
end
