#LAB6 Python starter code
#imports go here
#import MySQLdb
import _mysql

#code goes here

buffer = "true"



def oneQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="bechterc",db="craftbeer")
	db.query("""SELECT * FROM beer;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def twoQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="bechterc",db="craftbeer")
	db.query("""SELECT * FROM Brewery;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def threeQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="bechterc",db="craftbeer")
	db.query("""SELECT * FROM Style;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR>0):
		print(r.fetch_row())
		nR=nR-1
	db.close()

def fourQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="bechterc",db="craftbeer")
	db.query("""select brewery.breweryID, brewery.breweryName, count(*) as moststyles from brewery left join 
		taste on (brewery.breweryID = taste.breweryID) group by brewery.breweryID;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()
	
while buffer:
	print("""
	0.Exit
	1.See Beers
	2.See Breweries
	3.See Styles
	4.See which brewery has the most Styles! *3rd column*)
	""")
	buffer=input("what would you like to do? ")
	if buffer == 1:
		oneQuery()
	if buffer == 2:
		twoQuery()
	if buffer == 3:
		threeQuery()
	if buffer == 4:
		fourQuery()