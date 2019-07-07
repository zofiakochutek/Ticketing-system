# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets API', type: :request do 

  let!(:event) { create(:event) }
  let(:event_id) { event.id }
  let(:event_available_tickets) { event.available_tickets }
  let!(:payment) { create(:payment) }

  describe 'GET /events/:event_id/payment' do
    before { get "/events/#{event_id}/payment" }
  end

  # Test suite for POST /events/:event_id/payment
  describe 'POST /events/:event_id/payment' do 
    # valid payload
    let(:valid_attributes) do
      { amount: 10.0,
        token: 123456,
        currency: 'EUR'}
    end

    let(:attributes_with_error) do
      { amount: 10.0,
        token: 'card_error',
        currency: 'EUR' }
    end

    context 'when the request is valid' do

      before { post "/events/#{event_id}/payment", params: valid_attributes }
      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end

      it 'creates a ticket' do
        get "/events/#{event_id}/tickets"
        expect(json).not_to be_empty
      end

      it 'decreases the quantity of tickets' do
        get "/events/#{event_id}/"
        expect(json['available_tickets']).to eq(event_available_tickets - 1)
      end
    end

    context 'when the request is invalid' do
      it "should raise CardError" do
        expect{ 
          post "/events/#{event_id}/payment", params: attributes_with_error
         }.to raise_error(StandardError)
      end
    end
  end
end