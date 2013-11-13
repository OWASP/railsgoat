class WorkInfo < ActiveRecord::Base
  attr_accessible :DoB, :SSN, :bonuses, :income, :years_worked
  belongs_to :user
  #before_save :encrypt_ssn
  
  # We should probably use this
  def last_four
    "***-**-" << self.SSN[-4,4]
  end
  
  def encrypt_ssn(data)
  end
  
  def decrypt_ssn(encrypted_data)
  end
  
  def cipher_mode
    'aes-256-cbc'
  end
  
end
