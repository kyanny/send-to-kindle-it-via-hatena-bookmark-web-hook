# Send to Kindle It via Hatena Bookmark Web Hook

Send URL to your Kindle using [Kindle It](http://fivefilters.org/kindle-it/) via [Hatena Bookmark Web Hook (Japanese)](http://d.hatena.ne.jp/keyword/%A4%CF%A4%C6%A4%CA%A5%D6%A5%C3%A5%AF%A5%DE%A1%BC%A5%AF%20Web%20Hook).

# Setup

    $ git clone ...
    $ cd ...
    $ heroku apps:create
    $ heroku config:add HATENA_BOOKMARK_WEBHOOK_KEY=XXXX
    $ heroku config:add KINDLE_EMAIL_LOCAL_PART=kyanny (set your Kindle email local part)
    $ heroku config:add KINDLE_EMAIL_DOMAIN=free.kindle.com (If you want to get document via 3G, replace to kindle.com)
    $ git push heroku master

