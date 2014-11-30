## Oped

Sends you an email every day, prompting you to write a diary entry.


# Setup

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


```shell
heroku addons:open mailgun
```

```shell
heroku addons:open scheduler
```

```shell
heroku config:set TO_EMAIL=test@example.com
heroku config:set FROM_EMAIL=oped@appid.mailgun.org
```