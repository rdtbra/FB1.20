''
'' SQLite test, translated by Nex/marzec
''

option explicit

#include once "sqlite3.bi" 

const DEFAULT_DATABASE = "test.db"
const DEFAULT_QUERY	   = "select * from features"

declare sub showusage( )

declare function callback cdecl ( byval NotUsed as any ptr, _
								  byval argc as integer, _
								  byval argv as zstring ptr ptr, _
						 		  byval colName as zstring ptr ptr ) as integer

	dim as sqlite3 ptr db
	dim as zstring ptr errMsg 
	dim as string database_name, query

	if( __FB_ARGC__ > 3 ) then
		showusage
		end 1
	end if
	
	if( __FB_ARGC__ = 2 ) then
		database_name = command( 1 )
	else
		database_name = DEFAULT_DATABASE
	end if
	
	if( __FB_ARGC__ = 3 ) then
		query = command( 2 )
	else
		query = DEFAULT_QUERY
	end if
	
	if sqlite3_open( database_name, @db ) then 
  		print "Can't open database: "; *sqlite3_errmsg( db )
  		sqlite3_close( db ) 
  		end 1
	end if 
	
	print "Using database: "; database_name
	print

	if sqlite3_exec( db, query, @callback, 0, @errMsg ) <> SQLITE_OK then 
  		print "SQL error: "; *errMsg
	end if 

	sqlite3_close(db) 

'':::::
function callback cdecl ( byval NotUsed as any ptr, _
						  byval argc as integer, _
						  byval argv as zstring ptr ptr, _
						  byval colName as zstring ptr ptr ) as integer
  
	dim as integer i 

	for i = 0 to argc - 1
		print *colName[i], " = '";
		if *argv[i] <> 0 then 
			print *argv[i];
		else 
			print "NULL";
		end if
		print "'"
	next 
	
	print

	function = 0
   
end function 

'':::::
sub showusage( )
	print "Usage: "; command( 0 ); " database ""query"""
end sub