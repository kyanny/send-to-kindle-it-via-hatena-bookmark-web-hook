# Send to Kindle It via Hatena Bookmark Web Hook

Send URL to your Kindle using [Kindle It](http://fivefilters.org/kindle-it/) via [Hatena Bookmark Web Hook (Japanese)](http://d.hatena.ne.jp/keyword/%A4%CF%A4%C6%A4%CA%A5%D6%A5%C3%A5%AF%A5%DE%A1%BC%A5%AF%20Web%20Hook).

# Setup

First, create new app on Heroku.

    $ git clone git://github.com/kyanny/send-to-kindle-it-via-hatena-bookmark-web-hook.git
    $ cd send-to-kindle-it-via-hatena-bookmark-web-hook
    $ heroku apps:create
    $ heroku config:add KINDLE_EMAIL_LOCAL_PART=kyanny (set your Kindle email local part)
    $ heroku config:add KINDLE_EMAIL_DOMAIN=free.kindle.com (If you want to get document via 3G, replace to kindle.com)
    $ git push heroku master

Second, enable Hatena Bookmark Web Hook. Goto [外部サイト連携 - Web Hook (開発者さま向け, 3つまで登録できます)](http://b.hatena.ne.jp/a666666/config#tabmenu-config_table_coop) and enter your app's URL.

Finally, add one more config var.

    $ heroku config:add HATENA_BOOKMARK_WEBHOOK_KEY=XXXX

