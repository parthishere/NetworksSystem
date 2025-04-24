20/20 Get all files in www
0/10 wget -m index.html
10/10 GET / returns index.html
10/10 GET nosuchfile.html returns 404
10/10 GET unreadable.html returns 403
0/ 5 HELO header returns 400
0/ 5 Method PUT returns 405
5/ 5 HTTP/4.2 returns 505
5/ 5 HTTP versions match
0/10 Ordered parallel GET
10/10 Random parallel GET
0/10 Keep-Alive