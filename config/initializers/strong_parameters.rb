# frozen_string_literal: true
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
