require 'rails_helper'

RSpec.describe 'Tickets API' do 
    
  let!(:event) { create(:event) }
  let!(:tickets) { create_list(:ticket, 20, event_id: event.id) }
  let(:event_id) { event.id }
  let(:id) { tickets.first.id }

  describe 'GET /events/:event_id/tickets' do
    before { get "/events/#{event_id}/tickets" }

    context 'when event exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all event tickets' do
        expect(json.size).to eq(20)
      end
    end

    context 'when event does not exist' do
      let(:event_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event with 'id'=0/)
      end
    end
  end

  describe 'GET /events/:event_id/tickets/:id' do
    before { get "/events/#{event_id}/tickets/#{id}" }

    context 'when event ticket exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the ticket' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when event ticket does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ticket/)
      end
    end
  end

  describe 'POST /events/:event_id/tickets' do
    let(:valid_attributes) { { price: BigDecimal('75') } }

    context 'when request attributes are valid' do
      before { post "/events/#{event_id}/tickets", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/events/#{event_id}/tickets", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Price can't be blank/)
      end
    end
  end

  describe 'PUT /events/:event_id/tickets/:id' do
    p = BigDecimal('30')
    print 'this is big decimal: ',p , '\n' 
    let(:valid_attributes) { { price: p } }

    before { put "/events/#{event_id}/tickets/#{id}", params: valid_attributes }

    context 'when ticket exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the ticket' do
        updated_ticket = Ticket.find(id)
        expect(updated_ticket.price).to eq(p)
      end
    end

    context 'when the ticket does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ticket/)
      end
    end
  end

  describe 'DELETE /events/:id' do
    before { delete "/events/#{event_id}/tickets/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end