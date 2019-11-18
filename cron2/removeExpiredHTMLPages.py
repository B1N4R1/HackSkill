import MySQLdb
import os
import time

start_time = time.time()

db = MySQLdb.connect(host="127.0.0.1",user="root",passwd="",db="game")
cur = db.cursor()

#Remove /html/profile/id.html pages

expireInterval = 3600 #Perfis atualizados na ultima hora nao sao removidos

cur.execute("""	SELECT userID
				FROM cache_profile 
				WHERE 
					TIMESTAMPDIFF(SECOND, expireDate, NOW()) > """+str(expireInterval)+"""
			""")

for userID in cur.fetchall():

	userID = userID[0]

	try: 
		os.remove('/opt/lampp/htdocs/HE/html/profile/'+str(userID)+'.html')
	except:
		pass

	cur.execute("""	DELETE
					FROM cache_profile 
					WHERE 
						userID = """+str(userID)+"""
				""")

db.commit()

print time.strftime("%d/%m/%y %H:%M:%S"),' - ',__file__,' - ',round(time.time() - start_time, 4), "s"
