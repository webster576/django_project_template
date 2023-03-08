def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"UWSGI is working, but django app wansn't initialized"]
