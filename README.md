# README #

Welcome to the Funding Resource Project API. The API is hosted on heroku here: `https://frozen-tor-16945.herokuapp.com/`. I've included a brief guide to the API below for any future groups.

## Getting the API working locally ##

I'm going to give a broad list of steps.
1. Clone the app from git
    - something like ```git clone <url of repo here>```
2. Bundle your gems
    - make sure your ruby, rails, and postgres version match the versions specified in the GemFile
    - we use postgresql in dev, test, and production to make local development more closely match Heroku
    - this is likely the hardest part (especially if on a windows computer)
3. Turn on postgresql

If on a mac I recommend this UI for postgres. (It makes things much easier) `https://postgresapp.com/documentation/gui-tools.html`

I would recommend downloading the API testing app Isomnia, I use it for examples below. Find it here: `https://insomnia.rest`.

## Testing the API locally ##

So now with everything setup I want to test my API. First I run the following in my app directory. `rails s -p 3001` This will boot up the API at port 3001. 

Open up Isomnia and set the query url to `http://127.0.0.1:3001/registrations`. Change the request type to POST. Also, go to the Header tab and add a new header Content-Type with the value application/json. Now we need to give the POST request a body. Add a JSON body something like the following

```
{
	"user": {
		"email": "tester@gmail.com",
		"password": "asdfasdf",
		"password_confirmation": "asdfasdf"
	}
}
```

Now click send. We've just created a new user in our local system. We also should have received a cookie. In the Cookie tab on the left we should see a cookie called _funding_api. This cookie allows us to access parts of the API only for users.

Lets test our cookie to make sure its working. Set the query URL to `http://127.0.0.1:3001/logged_in` and change the request type to GET. Clear out the body from the last request and toggle the Content-type header off. Click send. You should get something like the following in the Preview tab on the right.

```
{
  "logged_in": true,
  "user": {
    "id": 4,
    "email": "tester@gmail.com",
    "password_digest": "$2a$12$qgqMRiEavTN03IIBmFuh5.aXtDfkN9.NzopcZiqcnVfOF2VjXL3ge",
    "is_admin": null,
    "created_at": "2021-03-19T02:56:58.163Z",
    "updated_at": "2021-03-19T02:56:58.163Z"
  }
}
```

What happened here? So Isomnia kept the cookie created by our last POST request and stored it. Then when we sent this GET request it used that cookie to tell the API that I am tester@gmail.com. The API responded by telling me I am a valid user that is logged in. Notice this account is not an admin, so certain controllers will deny me access if I try to send a request as tester@gmail.com.

Lets test this. Make a DELETE request to `http://127.0.0.1:3001/logout` (this ends our user session and invalidates our cookie). Then try to make a GET request to `http://127.0.0.1:3001/logged_in` again. We should see something like the following:

```
{
  "logged_in": false
}
```

Hopefully this helped you to understand the API :). To get a better idea of how to format query URLs check our controllers. Each method has its URL documented above and also check out the routes.rb file.

## Notes on Auth ##

A couple of notes, the most important authentication files are `config/initializers/cors.rb` and `config/initializers/sessions_store.rb` . The cors.rb file controls what websites are allowed to make requests to our API. The sessions_store.rb controls how cookies are created. Be careful when changing these files, we had to fine tune them to get cookies working. 

## Future Tasks ##

- Likely admins will want to 'knight' other admins. A well placed update method should handle that.
- Authentication is a crazy beast to tackle. But it can be done much better than our current system which uses Rails Sessions. If looking to improve it maybe try a gem such as devise? Or there are others ways to bundle React and Rails that are more auth friendly. Or even jump down the rabbit hole of JWT token authentication. Or just iron out how to best cache our cookie.
- Our backend team would often respond to the needs of the frontend team. They want to be able to get X data. We find a way to get and format that data. Likely as the frontend team progresses more backend needs will become apparent.

## Musings ##

I've copied a musing from a previous funding resource repo below. I quite like it. :) "Ruby on Rails is extremely difficult to learn. Ruby itself is fairly straightforward, but Rails is convoluted and foreign. It is just fine to be lost in the file system, confused about when to use plurals, and upset that the function definitions for one object are put in three or four different locations. Please remember that this language is a beast and that you unfortunately do not have enough time to fully grasp it (if you end up becoming a master Rails developer in seven weeks, please do not contact us to let us know)."

