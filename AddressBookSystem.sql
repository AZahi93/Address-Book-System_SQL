create database address_book_service; 
show databases;  
create table address_book ( firstName VARCHAR(20) NOT NULL,  
     lastName VARCHAR(20) NOT NULL,                         
     address VARCHAR(150) NOT NULL,
     city VARCHAR(20) NOT NULL,
     state VARCHAR(20)NOT NULL,
     zip INT NOT NULL,
     phoneNumber INT NOT NULL,
     email VARCHAR(100) NOT NULL);

DESCRIBE address_book; 				
insert into address_book (firstName,lastName,address,city,state,zip,phoneNumber,email) values  
      ('swetha','lavanya','amalapuram','Andhra Pradesh','HR',421301,12348577890,'swetha@gmail.com'),
      ('pradeep','kumar','warangal','telangana','MH',421203,1234567890,'pkmmr@gmail.com'),
      ('revathi','kapoor','karimnagar','Andhra Pradesh','MH',421223,1234567990,'rkpoor@gmail.com'),
      ('reshmi','khanna','hubli','Karnataka','MH',424891,12485927890,'reshmikhanna@gmail.com');

select * from address_book;

update address_book set zip = 532103 where firstName='reshmi';  

select * from address_book;   
delete from address_book where firstName='sushant';     

select * from address_book where city='kalyan' or state='MH';   
select count(city) from address_book;    

select count(state) from address_book;  


select * from address_book where city='kalyan' order by firstName;   
alter table address_book add type Varchar(20) NOT NULL;    
select * from address_book;                                           
update address_book set type = 'Friend' where firstname = 'swetha';        
update address_book set type = 'Family' where firstname = 'ravathi';     
select * from address_book;                                            

select count(type) from address_book where type = 'friend';          

 insert into address_book (firstName,lastName,address,city,state,zip,phoneNumber,email,type) values 
      ('sreeharika','choudary','anantapur','andhra pradesh','MH',421401,1274577890,'harika@gmail.com','friend'),
      ('kalyani','reddy','newyork','US',400003,8834567890,'kalyani@gmail.com','profession');

CREATE TABLE contacts (
  contact_id int,
  firstname varchar(20),
  lastname varchar(20),
  email varchar(150),
  phoneNo int,
 PRIMARY KEY (contact_id)
);

CREATE TABLE relation (
  relation_id int,
  type varchar(20),
  PRIMARY KEY (relation_id)
);

CREATE TABLE address_book (
  contact_id int,
  relation_id int,
  FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
  FOREIGN KEY (relation_id) REFERENCES relation(relation_id)
);

CREATE TABLE address (
  city varchar(20),
  state varchar(20),
  zipcode int,
  country varchar(20)
);

select count(type)
     from address_book a,person_details p,relation_type r
     where a.contact_id = p.contact_id
     and a.relation_id = r.relation_id
     group by type;

select count(state)
    from address ,person_details p
     where p.person_id = a.person_id
     and state = "mh";
