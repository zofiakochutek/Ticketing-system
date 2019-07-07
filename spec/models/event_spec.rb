require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  # ensure Event model has a 1:m relationship with the Ticket model
  it { should have_many(:tickets).dependent(:destroy) }
  # Validation tests
  # ensure columns name, date and time, available_tickets, ticket_price are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:available_tickets) }
  it { should validate_presence_of(:ticket_price) }
end
