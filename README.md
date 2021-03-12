# Bitlyke

Bitlyke is a link shortener similar to bitly. I had built a link shortener in the past but wanted to re-visit the idea with a year of professional coding experience.

At a high level, A user can post a `user_id` and a `full_url` to a shortening endpoint, which returns to them a shortened link. If this link is clicked, a visit to that link is recorded and the user is redirected to the `full_url` associated with that link. The number of times a link has been clicked can be accessed by hitting an analytics endpoint and passing in the slug of a short_link. 

###### Check it out in production

# Endpoints

### GET /:id

### POST /short_links

### GET /analytics/:id

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
