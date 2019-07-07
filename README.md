# Ticketing-system

This is a simple api for ticketing system.
Wrote in Ruby on Rails.

## Work with FE

Api provides specified below routes.

* [Get events]
'http localhost:3000/events'

* [Get particular event]
'http localhost:3000/events/event_id'

* [Post event]
'http POST localhost:3000/events name=theatre 
date=2019-07-06T15:57:36+02:00 time=2 available_tickets=1000 ticket_price=10'

* [Get tickets]
'http localhost:3000/events/event_id/tickets'

* [Get particular ticket]
'http localhost:3000/events/event_id/tickets/ticket_id'

* [Create ticket]
'http POST localhost:3000/events/event_id/payment amount=10 token=123 currency=EUR'

* [Get payments]
'http localhost:3000/events/event_id/payments'

