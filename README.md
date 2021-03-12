# Bitlyke

Bitlyke is a link shortener similar to bitly. I had built a link shortener in the past but wanted to re-visit the idea with a year of professional coding experience.

##### Overview

A user can post a `user_id` and a `full_url` to a shortening endpoint, which returns to them a shortened link. If this link is clicked, a visit to that link is recorded and the user is redirected to the `full_url` associated with that link. The number of times a link has been clicked can be accessed by hitting an analytics endpoint and passing in the slug of a short_link.

Shortened links are uniquely scoped to users, which is to say two different users could create a `short_link` of the same url but would each receive a `short_link` with a unique slug.

# Endpoints
- [Short Link Create](#short-link-create)
- [Short Link Redirect](#short-link-redirect)
- [Short Link Show](#short-link-show)

Bit1yke is currently deployed in production at https://bit1yke.herokuapp.com/. To tryout these endpoints in production you should format your requests like `https://bit1yke.herokuapp.com/analytics/:id`

### Short Link Create 
###### URL: /short_links | Method: POST | Required Params: "user_id", "full_url"
The endpoint to create a short_link. It takes a `user_id` and a `full_url` and returns a short_link in the following format:
```json
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

### Short Link Redirect
###### URL: /:id | Method: POST | Required Params: "id"[ID is the slug of a short_link]

The endpoint to redirect from a `short_link` to a full url. I chose to put this path at the root of the application because it makes it very simple to generate a short_link in the following format: `https://bit1yke.herokuapp.com/1d3`

This endpoint works by incrementing a `short_link`'s `visit_count` then redirecting to that `short_link`'s `full url`. For example, if you click https://bit1yke.herokuapp.com/1 you will be redirected to "https://www.google.com", the `full_url` for that `short_link` and that link's `visit_count` will be incremented.


### Short Link Show
###### URL: /analytics/:id | Method: GET | Required Params: "id"[ID is the slug of a short_link]
This endpoint fetches the all information for a 'short_link' For in the format:
```json
Response: 
{
    "short_link": "https://bit1yke.herokuapp.com/1",
    "full_url": "https://www.google.com",
    "user_id": 1,
    "visit_count": 1
}
```

## Running on your local machine
1. `$ git clone git@github.com:Patrick-Duvall/bitly.git`
2. `$ bundle`
3. `$ add your API keys to .env`: 
```yml
DOMAIN_NAME="http://localhost:3000/"
```
4. Install [Postgresql](https://www.postgresql.org/) if you do not have it.
5. `$ rails db:create`  to create dev and test databases
6. Run the test suite with `$ bundle exec rspec`, some tests will fail if ENV['DOMAIN_NAME'] is not set
7. Start a local server with `$ rails s` -- access in your browser or Postman at `localhost:3000`

## Built using
- Rails 5.2.x 
- Ruby 2.6.x
- RSPEC 3.1.x
- PostgreSQL database

