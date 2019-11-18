#!/bin/sh

/usr/bin/python /opt/lampp/htdocs/HE/cron2/updateCurStats.py; 
/usr/bin/python /opt/lampp/htdocs/HE/cron2/updateRanking.py; 
/usr/bin/python /opt/lampp/htdocs/HE/python/rank_generator.py;
