+++ 
draft = false
date = 2022-07-19T22:46:23-07:00
title = "Troubleshooting Elasticsearch Auth Issue"
slug = "" 
tags = ["elasticsearch, auth, error, password reset"]
categories = []
thumbnail = "images/benobi-one.png"
description = "troubleshoot elasticsearch auth error unable to authenticate user"
+++

I could not find a simple way to troubleshoot this elasticsearch auth error "unable to authenticate user" - it's amazing how this seems to be hard to find on the interwebs. So here is the secret.

## Solving unable to authenticate user error in elastic

First, to get this error, you can simply do this curl command:

`curl --user usename:pass -X GET "localhost:9200/_stats?pretty"`

Example of the auth error you will get if your password is wrong:
```
{
  "error" : {
    "root_cause" : [
      {
        "type" : "security_exception",
        "reason" : "unable to authenticate user [elastic] for REST request [/_stats?pretty]",
        "header" : {
          "WWW-Authenticate" : "Basic realm=\"security\" charset=\"UTF-8\""
        }
      }
    ],
    "type" : "security_exception",
    "reason" : "unable to authenticate user [elastic] for REST request [/_stats?pretty]",
    "header" : {
      "WWW-Authenticate" : "Basic realm=\"security\" charset=\"UTF-8\""
    }
  },
  "status" : 401
}
```

## Reset your Elasticsearch Password for all accounts

You can easily set the password back to what you think it is by running this command.

`/usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive`

I don't know why this elasticsearch bin is in /usr/share... that's not where I would have expected it to be, but you know - always learning new things and sharing. 

Hope this was helpful to someone else! 