require 'rails_helper'

RSpec.describe Payment, type: :model do
  # Validation tests
  # ensure columns amount, token, currency are present before saving
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:currency) }
end
