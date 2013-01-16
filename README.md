postman
=======

web api that takes zip code and returns city/state.


api
---

all apis returns json and it supports jsonp with ``callbacl`` parameter.


#### /:zip

it returns json that contains city, state, and state-abbreviation.


#### /ping

it returns empty success response. a purpose of this api is to wake up postman in case that it is deployed to heroku, which puts it to sleep when it is not used for awhile.
