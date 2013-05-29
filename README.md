Oauth and Twitter with Resque and Resque scheduler
===================================================
An app combinig oauth, twitter, resque and resque scheduler

Setting up the app and use
-----------------------------------------------------
Configure the following variables in application.yml
* TWITTER_KEY: 'your twitter consumer key'
* TWITTER_SECRET: 'your twitter consumer secret'
* REDIS_SERVER: 'your Redis server address'

Run the following:

    rake resque:setup

To start the scheduler:

    rake resque:scheduler

And to start a worker:

    rake resque:work