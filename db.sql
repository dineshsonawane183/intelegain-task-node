# create database testdb;
# use testdb;
 
 CREATE TABLE USERS_TABLE 
    (   
    ID INT NOT NULL AUTO_INCREMENT, 
    USER_NAME VARCHAR(20) NOT NULL, 
    PASSWORD VARCHAR(100) NOT NULL, 
    FIRST_NAME VARCHAR(100) NOT NULL, 
    LAST_NAME VARCHAR(100), 
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    ROLE_ID_FK INT NOT NULL, 
    PRIMARY KEY (ID),
    FOREIGN KEY (ROLE_ID_FK)
    REFERENCES USER_ROLES (ID)
    );     

  CREATE TABLE USER_ROLES 
    (   
    ID INT NOT NULL AUTO_INCREMENT, 
    ROLE_TYPE VARCHAR(20) NOT NULL, 
    ROLE_DESCRIPTION VARCHAR(100) NOT NULL, 
	EMAIL VARCHAR(255) NOT NULL, 
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PERMISSION_ID_FK INT NOT NULL, 
    PRIMARY KEY (ID), 
    FOREIGN KEY (PERMISSION_ID_FK)
    REFERENCES PERMISSIONS_TABLE (ID)
    );   


CREATE TABLE PERMISSIONS_TABLE 
   (    
    ID INT NOT NULL AUTO_INCREMENT, 
    PERMISSION_CODE VARCHAR(20) NOT NULL, 
    PERMISSION_DESC VARCHAR(100) NOT NULL, 
    CREATED_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
     PRIMARY KEY (ID)
   );
   
#   drop table PERMISSIONS_TABLE;
#   drop table USER_ROLES;
# 	drop table USERS_TABLE;
   
   
   
insert into permissions_table (PERMISSION_CODE,PERMISSION_DESC) values ("READ","user can view details"); 
insert into permissions_table (PERMISSION_CODE,PERMISSION_DESC) values ("CREATE","user can create user");
insert into permissions_table (PERMISSION_CODE,PERMISSION_DESC) values ("ALL","user have all access"); 
   
insert into user_roles (ROLE_TYPE,ROLE_DESCRIPTION,PERMISSION_ID_FK) VALUES("ADMIN","ALL",2);
insert into user_roles (ROLE_TYPE,ROLE_DESCRIPTION,PERMISSION_ID_FK,PARENT) VALUES("GUEST","READ",3,5);

insert into users_table (USER_NAME,PASSWORD,FIRST_NAME,LAST_NAME) values ("dinesh.sonawane","pass@123","Dinesh","Sonawane");
   
select * from PERMISSIONS_TABLE;
select * from user_roles;
select * from users_table;

delete from users_table where id >1;

# alter table users_table modify column password text not null;
#alter table USER_ROLES add column parent INT not null;

#alter table users_table add column email varchar(255) not null;
   
   
 # ADDD PARENT REFERENCE TO ROLE
   
   
   
   