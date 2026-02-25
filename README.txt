jag fick göra två readme en för läraren och en för Lia i github.
denna är till läraren.



Motivering och samspel mellan PostgreSQL och MongoDB, samt instruktioner för att sakpa databasen och importera testdata.
postgres för realtionsdatabase och mongodb för flexibilitet, upskalning och mycket data av någorlunda mindre prio.
Mongodb har används här för data typer som skalar up mycket, snabbt och kan eller kan ej vara väldigt viktig.
MongoDb för: logs, messages. den del av databasen som på nåt sätt stackar up i lager och man behöver titta där sällan.
logs som user login, user created, user deleted etc. i själva projekted har jag bara user login men tanken är samma.

MongoDb databasen har attributerna user_id och channel_id som postgres för att koppla data med postgres, 

Skappa databasen: copy pastar vad jag skrev på README github filen.

Quick Setup Guide before README:
Option 1:
Datagrip -> create a database, connect to it.
Open Query.
  -Open schema.sql   with text editor, copy paste and run the query.
  -Open seed.sql     with text editor, copy paste and run the query.
  -Open queries.sql  with text editor, copy paste and run the query.


Option 2:
Create a database connect to it using Datagrip.
 Right click on the newly created database.
  Click on import/export -> Dump to DDL Data source -> Create ddl data source...
   Check on top left part of now opened window make sure you have
-nameOfYourDatabase@localhost (DDL) under Data sources and its marked or highlighted Blue.
     Click on Add Directories or DDL files
       Choose schema.sql from downloaded files.
in File View/ File explorer, if not opened by default check top window to resolve.
 in files window open schema.sql
  now run the query.

Repeat same step for seeds.sql and queries.sql


