# Mario Verde Client
Hi all and welcome to the GitHub Repo for Mario Verde.
This project is designed to be a matchmaking service for those looking for someone to play with.

## Description
We all know that games are more fun when played together, but random matchmaing provides limited tools for making new friends and that the built in tools for meeting peeople seem to bring out the worst in everyone.
This tool aims to make it easier to play together.
On Mario Verde players can post events, each with a title, description, time, and some contact info. Players can then reach out and make plans to play with each other. Thus making
## Technology
### Front End
- [HTML 5](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference)
- [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
- [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
- [jQuery](https://api.jquery.com/)
- [Bootstrap](https://getbootstrap.com/docs/4.3/getting-started/introduction/)
- [Handlebars JS](https://handlebarsjs.com/)

### Back End
- [PostgreSQL](https://www.postgresql.org/docs/)
- [Ruby](https://ruby-doc.org/)
- [Ruby on Rails](https://guides.rubyonrails.org/)

## How it works
Front end makes ajax requests to the api.
the API is a restufl api built on ruby on rails. it queries the database and returns a JSON.
JavaScript parses the JSON and renders pieces of it on the page using handlebars.

## Planning
The biggest challenge in planning this project was deciding on what to make. My original idea was for a find a belay buddy site but I disliked how reliant that idea was on location, so I applied the same idea to online games. The service is geared more towards owners of a nintendo switch and tabletop players but will also be flexible enough for players on other platforms to make use of it.

Next I planned out my "pie in the sky" project database, by mapping out tables and planning columns.

From there I drew up some quick wireframes to give me a vague idea of how my project should work.

My development process from this point has been entirely driven by the information in the [requirments](./requirements.md) file.

This document will list planned improvements and will be the guiding doc for all future improvements. Please see that section for more information on my planning process.

## Problem solving
- Check that the problem is a requirment
- Double check that its actually a requirement
- Read the error message
- Check for plurlalization/capitalization
- Check syntax
- Check if the code thats giving you trouble works somewhere else
- Simplify the code/process
- console log paramaters
- console log output
- try running code again
- Try do do it differently if none of the above worked and you still get the same error message


## Entity Relationship Diagram
[Initial ERD](https://imgur.com/CjyIGyF)

Current ERD
```
|users|-|-<|events|
```

## Known Bugs
honestly there's so little right now that i don't know of any. Please open an issue if you find any.

## Wirerames
[Desktop](https://imgur.com/3rN1cbD)
[Mobile](https://imgur.com/sRafjj3)

## User stories
as a user I'd like to create an account so i can browse games
as a user I'd like to log in so i can respond to events
as a user I'd like to create an event to play with strangers online
as a user I'd like to check and see if players have responded to my event
as a user I'd like to sign up to "attend" an event hosted by another player so i can play games
as a user I'd like to hide my email/discord id/nintendo id from the genral public
as a user i'd like my email/discord id/nintendo ide to be visible to attendees or hosts for events i'm participating in

## Potential Future Improvements
- Meta
  - find a better way to identify and catalog necessary UX improvements
- UI Improvements
  - Put each item in a box
  - Create Nav Bar
  - Add Color
  - allow users to hide their contact info
- Features
  - Pin the user's events to the top
  - allow users to delete their events in by clicking a delete button related to that event
  - allow users to hide events they arent interested in attending
  - allow users to only display events based on a dropdown
  - allow users to search for events by keyword
  - sort events by date
  - hide events with past dates
  - allow users to sign up as an attendee for an event
-DB Changes
  - add column to users for profile
  - add column to users for discord id
  - add column to events for platform (xbox, pc, switch, playstation, tabletop)
  - create attendees table
    - many to many relationship from events and users

## API

Scripts are included in [`curl-scripts`](curl-scripts) to test built-in actions. Add your
own scripts to test your custom API. As an alternative, you can write automated
tests in RSpec to test your API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password`     | `users#changepw`  |
| DELETE | `/sign-out`            | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
OLDPW='hannah' NEWPW='elle' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out

Request:

```sh
curl http://localhost:4741/sign-out \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |
| PATCH| `/users/1`  | `users#update`    |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f curl-scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f curl-scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

#### PATCH /users/:id

Request:

```sh
curl "http://localhost:4741/users/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "email": "'"${EMAIL}"'"
    }
  }'
```

```sh
ID=1 TOKEN="BAhJIiU1NGNlYjRmMjBhM2NkZTZiNzk1MGNiYmZiYWMyY2U4MwY6BkVG--ddb1e16af0e05921aa56d771e4a2f816f2a1d46e"
EMAIL=mike@m
sh curl-scripts/users/user-update.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{"user":{"id":1,"email":"mike@m"}}
```


### Events
| Verb    | URI Pattern           | Controller#Action |
|---------|-----------------------|-------------------|
| POST    | `/events`             | `users#create`    |
| GET     | `/events`             | `events#index`    |
| GET     |  `/events/:id`        | `events#show`     |
| PATCH   | `/events/:id`         | `events#update`   |
| DELETE  | `/events/:id`         | `events#destroy`  |
