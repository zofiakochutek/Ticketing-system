# Ticketing-system

This is a simple api for a ticketing system.
Wrote in Ruby on Rails.

## Api provides routes specified below

* Get events
``` 
http localhost:3000/events
```
```
[
  {
    "id": 1,
    "name": "cinema",
    "date": "2019-07-06T13:57:36.000Z",
    "created_at": "2019-07-07T17:58:32.988Z",
    "updated_at": "2019-07-07T19:27:17.415Z",
    "time": "2.0",
    "available_tickets": 95,
    "ticket_price": "10.0"
  },
  {
    "id": 2,
    "name": "theatre",
    "date": "2019-07-06T13:57:36.000Z",
    "created_at": "2019-07-07T19:17:22.685Z",
    "updated_at": "2019-07-07T19:17:22.685Z",
    "time": "2.0",
    "available_tickets": 1000,
    "ticket_price": "10.0"
  }
]
```

* Get particular event
```
http localhost:3000/events/:event_id
```
```
{
  "id": 1,
  "name": "cinema",
  "date": "2019-07-06T13:57:36.000Z",
  "created_at": "2019-07-07T17:58:32.988Z",
  "updated_at": "2019-07-07T19:27:17.415Z",
  "time": "2.0",
  "available_tickets": 95,
  "ticket_price": "10.0"
}
```

* Post event
```
http POST localhost:3000/events 
name=theatre date=2019-07-06T15:57:36+02:00 time=2 available_tickets=1000 ticket_price=10
```
```
{
  "id": 5,
  "name": "cooking workshops",
  "date": "2019-07-06T13:57:36.000Z",
  "created_at": "2019-07-08T10:05:49.043Z",
  "updated_at": "2019-07-08T10:05:49.043Z",
  "time": "4.0",
  "available_tickets": 50,
  "ticket_price": "20.0"
}
```

* Get tickets
```
http localhost:3000/events/:event_id/tickets
```
```
[
  {
    "id": 6,
    "event_id": 3,
    "created_at": "2019-07-08T10:06:33.295Z",
    "updated_at": "2019-07-08T10:06:33.295Z"
  },
  {
    "id": 7,
    "event_id": 3,
    "created_at": "2019-07-08T10:06:37.661Z",
    "updated_at": "2019-07-08T10:06:37.661Z"
  }
]
```

* Get particular ticket
```
http localhost:3000/events/:event_id/tickets/ticket_id
```
```
{
  "id": 1,
  "event_id": 1,
  "created_at": "2019-07-07T17:58:57.806Z",
  "updated_at": "2019-07-07T17:58:57.806Z"
}
```

* Create ticket
```
http POST localhost:3000/events/:event_id/payment 
amount=10 token=123 currency=EUR
```
Response is the event with decreased quantity of tickets.
When supplied token is 'card_error' or 'payment_error' 
then the response has status error 500.
```
{
  "id": 2,
  "available_tickets": 998,
  "name": "theatre",
  "date": "2019-07-06T13:57:36.000Z",
  "time": "2.0",
  "ticket_price": "10.0",
  "created_at": "2019-07-07T19:17:22.685Z",
  "updated_at": "2019-07-08T10:10:27.706Z"
}
```
