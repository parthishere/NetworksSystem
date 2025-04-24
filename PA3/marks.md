Proxy Tests
10 GET http://netsys.cs.colorado.edu/index.html succeeded
GET http://netsys.cs.colorado.edu recursive failed
3 GET http://netsys.cs.colorado.edu 19% parallel match

Bad Request Tests
2 HELO http://netsys.cs.colorado.edu/index.html returns 4xx
2 PUT http://netsys.cs.colorado.edu/newfile.dat returns 4xx
2 GET http://bar.cs.colorado.edu/index.html returns 4xx
GET http://netsys.cs.colorado.edu:88/index.html doesn't return 4xx
2 GET http://netsys.cs.colorado.edu/nosuchfile.html returns 4xx

Blocked Site Tests
2 GET http://www.google.com/index.html blocked returns 403
2 GET http://www.facebook.com blocked returns 403
2 GET http://www.facebook.com:8080 blocked returns 403
2 GET http://23.237.16.149 blocked returns 403
2 GET http://23.237.16.149:80 blocked returns 403

Caching Tests
30 76% cache hit rate detected
6 56% prefetch hit rate detected