# Oped

Sends you an email every day, prompting you to write a diary entry. Email responses are saved in a database.

## Setup

1) Click on the Heroku Button to create your app.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

2) Run the database migrations:

```shell
heroku run rake db:migrate -a your-app-name
```

3) Configure Mailgun, by first opening up the addon SSO, then in the Mailgun interface add a new route.

```shell
heroku addons:open mailgun -a your-app-name
```

![Mailgun](https://maccman.github.io/docs/mailgun.png)

4) Configure the Heroku scheduler to send out the daily emails.

```shell
heroku addons:open scheduler
```

![Scheduler](https://maccman.github.io/docs/scheduler.png)

5) Lastly set some configuration variables. Set `TO_EMAIL` to your email address, and `FROM_EMAIL` to the email address Mailgun generated for you.

```shell
heroku config:set TO_EMAIL=test@example.com
heroku config:set FROM_EMAIL=oped@appid.mailgun.org
```

## Testing

To test Oped, run `rake prompt`. An email should be sent to you. Any replies to this email will be saved in the `posts` table.

```shell
heroku run rake prompt
```

## Export

To exports posts:

```shell
# Table Preview
heroku run rake posts:table | less

# Export to CSV
heroku run rake posts:csv > posts.csv
```