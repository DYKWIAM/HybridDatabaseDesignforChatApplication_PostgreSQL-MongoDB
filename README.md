# Hybrid Database Design for ChatApplication with PostgreSQL-MongoDB #
### This project demonstrates my grasp of key concepts and practical skills in subject Databas-teknik. ### 
ChatGPT has been helpful for generating seed-data and assisting me with this README file which is lets face it much better especially with icons and layout.



### **🌟 Overview** ###
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

The goal is to demonstrate proper relational modeling principles combined with practical postgres usage.  
### **🏗 System Architecture** ###  
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

### ** Relational Layer – PostgreSQL** ###  

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

 ### **🧩 Core Tables** ###  
users
channels
roles
user_channel_memberships
user_roles

 ### **🔄 Relationship Design** ### 
1–N → Users → Memberships
1–N → Channels → Memberships
N–N → Users ↔ Channels
N–N → Users ↔ Roles

 ### **👁 View** ### 
channel_member_view
Provides a joined representation of channels and their members using SQL JOINs.


 ### **🍃 Document Layer – MongoDB** ### 
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

No schema migrations required.

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
  "user_id": 2,
  "channel_id": 1,
  "event": "join",
  "timestamp": ISODate("2026-02-25T09:00:00Z")
}
🗺 ER Diagram (Conceptual)
[ USERS ] ----< [ USER_CHANNEL_MEMBERSHIPS ] >---- [ CHANNELS ]
     |
     v
[ USER_ROLES ] >---- [ ROLES ]

✔ Junction tables implement N–N relationships
✔ Referential integrity enforced via foreign keys

 ### 📂 Project Structure ###  
![Alt text](/ER%20DIAGRAM.png)



 ### Setup guide ### 
Run the schema.sql in Datagrip or cli  
Run the seeds.sql in Datagrip or cli  
Run queries.sql in Datagrip, -> if you wanna run queries in cli being bash or cmd open the file with notepad or any other text editor and run
    the query of choice.  




