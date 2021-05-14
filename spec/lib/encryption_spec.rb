# frozen_string_literal: true
require "spec_helper"
require_relative "../../lib/encryption"

describe Encryption do
  let(:value) {
    allow(Encryption).to receive(:key).and_return(SecureRandom.bytes(32))
    allow(Encryption).to receive(:iv).and_return(SecureRandom.bytes(16))

    "OMG PII"
  }

  it "encrypts values" do
    encrypted = Encryption.encrypt_sensitive_value(value)
    expect(Base64.decode64(encrypted)).not_to eq(value)
  end

  it "decrypts values" do
    encrypted = Encryption.encrypt_sensitive_value(value)
    decrypted = Encryption.decrypt_sensitive_value(encrypted)

    expect(decrypted).to eq(value)
  end
end
