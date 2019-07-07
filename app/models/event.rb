class Event < ApplicationRecord
  # model association
  has_many :tickets, dependent: :destroy

  # validations
  validates_presence_of :name, :date, :time, :available_tickets, :ticket_price
end
