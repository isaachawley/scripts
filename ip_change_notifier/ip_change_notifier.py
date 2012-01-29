import socket
import urllib2
import sys
import time
import smtplib
from twitter import Twitter,OAuth

f = open("/home/isaac/code/ip_change_notifier/ip.txt", 'r+')
old_ip = f.readline()
old_ip = old_ip.strip("\n")
f.close()

response = urllib2.urlopen("http://ifconfig.me/ip")
html = response.read()
html = html.strip()
html = html.strip("\n")

if (html != old_ip):
	print "IPs differ! tweeting"
	#keys removed :)
	twitter = Twitter(auth=OAuth('','','',''))
	twitter.statuses.update(status=html)
	f = open("/home/isaac/code/ip_change_notifier/ip.txt", 'w')
	f.write(html)

f.close()

