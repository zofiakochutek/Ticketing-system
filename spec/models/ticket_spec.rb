require 'rails_helper'

RSpec.describe Ticket, type: :model do
    # Association test
  # ensure a ticket record belongs to a single event record
  it { should belong_to(:event) }
end
