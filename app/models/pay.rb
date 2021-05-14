# frozen_string_literal: true
class Pay < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :bank_account_num, presence: true
  validates :bank_routing_num, presence: true
  validates :percent_of_deposit, presence: true

  # callbacks
  before_save :encrypt_bank_account_num

  def as_json
    super(only: [:bank_account_num, :bank_routing_num, :percent_of_deposit, :id])
  end

  def encrypt_bank_account_num
    self.bank_account_num = Encryption.encrypt_sensitive_value(self.bank_account_num)
  end
end
