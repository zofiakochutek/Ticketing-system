class Ticket < ApplicationRecord
  # model association
  belongs_to :event

  # validation
  validates_presence_of :price
end
