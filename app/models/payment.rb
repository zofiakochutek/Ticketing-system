# frozen_string_literal: true

class Payment < ApplicationRecord
  # validations
  validates_presence_of :amount, :token, :currency
end
