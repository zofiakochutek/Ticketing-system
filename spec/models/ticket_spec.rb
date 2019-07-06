require 'rails_helper'

RSpec.describe Ticket, type: :model do
    # Association test
  # ensure a ticket record belongs to a single event record
  it { should belong_to(:event) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:price) }
end
