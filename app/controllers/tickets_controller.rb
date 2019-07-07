class TicketsController < ApplicationController
  before_action :set_event
  before_action :set_event_ticket, only: [:show, :update, :destroy]

  # GET /events/:id/tickets
  def index
    json_response(@event.tickets)
  end

  # GET /events/:id/tickets/:ticket_id
  def show
    json_response(@ticket)
  end

  # DELETE /events/:id/tickets/:ticket_id
  def destroy
    @ticket.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_ticket
    @ticket = @event.tickets.find_by!(id: params[:id]) if @event
  end
end