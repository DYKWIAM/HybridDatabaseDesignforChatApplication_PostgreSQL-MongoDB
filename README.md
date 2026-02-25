# Hybrid Database Design for ChatApplication with PostgreSQL-MongoDB #
### This project demonstrates my grasp of key concepts and practical skills in subject Databas-teknik. ### 
#### The goal is to demonstrate proper relational modeling principles combined with practical postgres usage and MongoGB. ####
ChatGPT has been helpful for generating seed-data and assisting me with this README file which is lets face it much better especially with icons and layout.


**Quick Setup Guide before README:**
<br>
Download the files.  
**Option 1:**
<br>
Datagrip -> create a database, connect to it.  
Open Query.  
&nbsp;&nbsp;-Open schema.sql &nbsp;&nbsp;with text editor, copy paste and run the query.  
&nbsp;&nbsp;-Open seed.sql &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with text editor, copy paste and run the query.  
&nbsp;&nbsp;-Open queries.sql &nbsp;&nbsp;with text editor, copy paste  and run the query.  
<br>

**Option 2:**  
Create a database connect to it using Datagrip.  
&nbsp;Right click on the newly created database.  
&nbsp;&nbsp;Click on import/export -> Dump to DDL Data source -> Create ddl data source...  
&nbsp;&nbsp;&nbsp;Check on top left part of now opened window make sure you have  
	-nameOfYourDatabase@localhost (DDL) under Data sources and its marked or  highlighted Blue.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click on Add Directories or DDL files  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Choose schema.sql from downloaded files.   
in File View/ File explorer, if not opened by default check top window to resolve.  
&nbsp;in files window open schema.sql  
&nbsp;&nbsp;now run the query.  
Repeat same step for seeds.sql and queries.sql  


**🌟 Overview** <br>
This project implements a hybrid database architecture for a chat system using:
PostgreSQL — structured relational data
MongoDB — flexible, high-volume event data

**The system models:**  
👤 Users  
🛡 Roles  
💬 Channels  
🔗 Channel memberships  
🏷 Role assignments  
📨 Messages  
📜 Join/leave logs  
 
**🏗 System Architecture**
<br> 
The system separates data storage responsibilities based on data structure and behavior.

📦 Data Type	🗄 Database	🎯 Why  
    Users	    PostgreSQL	Strong consistency  
    Roles	    PostgreSQL	Permission control  
    Channels	PostgreSQL	Relational integrity  
    Memberships	PostgreSQL	N–N enforcement  
    Messages	MongoDB	    Write-heavy, flexible schema, storage  
    Join Logs	MongoDB	    Event-based storage  

✅ Structured data → Relational database  
✅ Dynamic, log-based data → Document database

**Relational Layer – PostgreSQL**
<br>
Fully normalized to ### **Third Normal Form (3NF).** ###  

🔑 Features Implemented
✔ Primary Keys  
✔ Foreign Keys  
✔ CHECK Constraints  
✔ UNIQUE Constraints  
✔ ON DELETE CASCADE  
✔ Composite Primary Keys  
✔ View Definition  
✔ Aggregate Queries  

**🧩 Core Tables**  
users  
channels  
roles  
user_channel_memberships  
user_roles  

**🔄 Relationship Design**
1–N → Users → Memberships  
1–N → Channels → Memberships  
N–N → Users ↔ Channels  
N–N → Users ↔ Roles  

**👁 View**
channel_member_view  
Provides a joined representation of channels and their members using SQL JOINs.  

**🍃 Document Layer – MongoDB**   
MongoDB stores:  
--Messages  
--Channel Join/Leave Logs  
--Why MongoDB?  
--Flexible Schema  
Messages may evolve with:  
Reactions  
Attachments  
Edits  
Metadata  
<br>
No schema migrations required.  
<br>
⚡ High Write Throughput  
Chat systems are:  
Insert-heavy  
Time-based  
Append-driven  
MongoDB handles this efficiently.  

**📜 Event-Based Modeling**  
Join logs are naturally represented as document-based events.  
Example:  
{  
&nbsp;&nbsp;  "user_id": 2,  
&nbsp;&nbsp;  "channel_id": 1,  
&nbsp;&nbsp;  "event": "join",  
&nbsp;&nbsp;  "timestamp": ISODate("2026-02-25T09:00:00Z")  
} 

### 🗺 ER Diagram (Conceptual) ###  
[ USERS ] ----< [ USER_CHANNEL_MEMBERSHIPS ] >---- [ CHANNELS ]  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    |  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   v  
&nbsp;&nbsp;&nbsp;[ USER_ROLES ] >---- [ ROLES ]  
  
✔ Junction tables implement N–N relationships  
✔ Referential integrity enforced via foreign keys  

 ### 📂 Project Structure ###  
![Alt text](/ER%20DIAGRAM.png)




**🔥 H I R E D 🔥**

