# frozen_string_literal: true
class KeyManagement < ApplicationRecord
  belongs_to :work_info
  belongs_to :user
end
