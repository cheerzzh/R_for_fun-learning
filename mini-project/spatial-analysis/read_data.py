# Download milano tweets data using python
# chengjun wang @ cmc# 2014 Mar 11 
import urllib2 
import json 

f = open('Milano_sample.csv', 'w') 
for offset in range(0,269290/100 +1): 
	print "working on offset: ", offset 
	req_url = 'https://api.dandelion.eu/datagem/social-pulse-milano/data/v1/?$limit=100&$offset='+str(offset)+'&$app_id=d...a&$app_key=2e...7c' 
	jstr = urllib2.urlopen(req_url).read() # json string 
	""" these are flickr-specific """ 
	jinfo = json.loads( jstr ) 
	for i in range(0, len(jinfo['items'])): 
		lan = jinfo['items'][i]['language'] 
		time = jinfo['items'][i]['created'] 
		geo = jinfo['items'][i]['geometry']['coordinates'] 
		timestamp = jinfo['items'][i]['timestamp'] 
		municipality_name = jinfo['items'][i]['municipality']['name'] 
		municipality_id = jinfo['items'][i]['municipality']['acheneID'] 
		entities = jinfo['items'][i]['entities'] 
		user = jinfo['items'][i]['user'] 
		print >>f, "%s;%s;%s;%s;%s;%s;'%s';%s" % (lan, time, geo, timestamp, municipality_name, municipality_id, entities, user) 

f.close()


https://api.dandelion.eu/datagem/social-pulse-milano/data/v1/?$limit=100&$offset=0&$app_id=d...a&$app_key=2e...7c