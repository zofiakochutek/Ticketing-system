class PaymentController < ApplicationController

    # POST /events
    def create
        # check payment
        
        @event = Ticket.create!(ticket_params)
        json_response(@event, :created)
    end

    private

    def ticket_params
        # whitelist params
        params.permit(:amount, :token, :currency)
    end
    
end
