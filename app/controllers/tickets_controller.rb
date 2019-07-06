class TicketsController < ApplicationController
    before_action :set_event
    before_action :set_event_ticket, only: [:show, :update, :destroy]
  
    def index
      json_response(@event.tickets)
    end
  
    def show
      json_response(@ticket)
    end
  
    def create
      @event.tickets.create!(ticket_params)
      json_response(@event, :created)
    end
  
    def update
      @ticket.update(ticket_params)
      head :no_content
    end
  
    def destroy
      @ticket.destroy
      head :no_content
    end
  
    private
  
    def ticket_params
      params.permit(:name, :done)
    end
  
    def set_event
      @event = Event.find(params[:event_id])
    end
  
    def set_event_ticket
      @ticket = @event.tickets.find_by!(id: params[:id]) if @event
    end
  end