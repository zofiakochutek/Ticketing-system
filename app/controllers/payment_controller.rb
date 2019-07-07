# frozen_string_literal: true

class PaymentController < ApplicationController
  before_action :set_event

  include Adapters::Payment

  # POST /events/:event_id/tickets
  def create
    Gateway.charge(
      amount: params[:amount], token: params[:token], currency: params[:currency]
    )
    @event.tickets.create!
    new_quantity = @event.available_tickets -= 1
    @event.update(available_tickets: new_quantity)
    json_response(@event, :created)
  end

  private

  def payment_params
    # whitelist params
    params.permit(:amount, :token, :currency)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_ticket
    @ticket = @event.tickets.find_by!(id: params[:id]) if @event
  end

end
