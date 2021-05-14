# frozen_string_literal: true
class WorkInfo < ApplicationRecord
  belongs_to :user
  has_one :key_management, foreign_key: :user_id, primary_key: :user_id, dependent: :destroy
  #before_save :encrypt_ssn

  # We should probably use this
  def last_four
    "***-**-" << self.decrypt_ssn[-4, 4]
  end

  def encrypt_ssn
    aes = OpenSSL::Cipher.new(cipher_type)
    aes.encrypt
    aes.key = key[0..31]
    aes.iv = iv if iv != nil
    self.encrypted_ssn = aes.update(self.SSN) + aes.final
    self.SSN = nil
  end

  def decrypt_ssn
    aes = OpenSSL::Cipher.new(cipher_type)
    aes.decrypt
    aes.key = key[0..31]
    aes.iv = iv if iv != nil
    aes.update(self.encrypted_ssn) + aes.final
  end

  def key
    raise "Key Missing" unless KEY.present?
    KEY
  end

  def iv
    raise "No IV for this User" unless self.key_management.try(:iv).present?
    self.key_management.iv
  end

  def cipher_type
    "aes-256-cbc"
  end
end
