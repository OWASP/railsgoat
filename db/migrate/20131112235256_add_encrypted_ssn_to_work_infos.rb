# frozen_string_literal: true
class AddEncryptedSsnToWorkInfos < ActiveRecord::Migration[4.2]
  def change
    add_column :work_infos, :encrypted_ssn, :binary
  end
end
