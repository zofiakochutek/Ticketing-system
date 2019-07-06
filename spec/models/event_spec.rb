require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  # ensure Event model has a 1:m relationship with the Ticket model
  it { should have_many(:tickets).dependent(:destroy) }
  # Validation tests
  # ensure columns name, date and tickets_quanitity are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:tickets_quantity) }
end
