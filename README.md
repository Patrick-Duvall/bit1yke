# Bitlyke

Bitlyke is a link shortener similar to bitly. I had built a link shortener in the past but wanted to re-visit the idea with a year of professional coding experience.

At a high level, A user can post a `user_id` and a `full_url` to a shortening endpoint, which returns to them a shortened link. If this link is clicked, a visit to that link is recorded and the user is redirected to the `full_url` associated with that link. The number of times a link has been clicked can be accessed by hitting an analytics endpoint and passing in the slug of a short_link.

# Architechture

# Endpoints

Bit1yke is currently deployed in production at https://bit1yke.herokuapp.com/. To tryout these endpoints in production you should format your requests like `https://bit1yke.herokuapp.com/analytics/:id`

### POST /short_links

The endpoint to create a short_link. It takes a `user_id` and a `full_url` and returns a short_link in the following format:
```json
POST /short_links
Request Params:
{
    "user_id": 1,
    "full_url": "https://www.google.com"
}

Response:
{
    "short_link": "https://bit1yke.herokuapp.com/1",
    "full_url": "https://www.google.com",
    "user_id": 1,
    "visit_count": 0
}
```
This endpoint renders model level errors if a resource fails to create. For example a request with no params:
```json
POST /short_links
Request Params:{}

Response:
{
    "errors": [
        "User can't be blank",
        "Full url can't be blank",
        "Full url Please provide a valid url with protocol"
    ]
}
```

### GET /:id

The endpoint to redirect from a `short_link` to a full url. I chose to put this path at the root of the application because it makes it very simple to generate a short_link in the following format: `https://bit1yke.herokuapp.com/1d3`

This endpoint works by incrementing a `short_link`'s `visit_count` then redirecting to that `short_link`'s `full url`. For example, if you click https://bit1yke.herokuapp.com/1 you will be redirected to "https://www.google.com", the full_url for that short_link.


### GET /analytics/:id

This endpoint fetches the information for a 'short_link' inlcluding all information about that link. For example:
```json
GET analytics/1

Response: 
{
    "short_link": "https://bit1yke.herokuapp.com/1",
    "full_url": "https://www.google.com",
    "user_id": 1,
    "visit_count": 1
}
```

# Highlights

### Inheritance

### Validations

### Environmental Variables

### Polymorphism

# Running locally

## Testing



Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
