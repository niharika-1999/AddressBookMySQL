create database address_book_service; #Creating AddresssBook Service DB
show databases;
use address_book_service;

create table addressBook  #Creating AddressBook Table
(
firstName varchar(100) NOT NULL PRIMARY KEY ,
lastName varchar(100) NOT NULL,
address varchar(100) NOT NULL,
city varchar(100) NOT NULL,
state varchar(100) NOT NULL,
zip varchar(6) NOT NULL,
phone varchar(12) NOT NULL,
email varchar(100) NOT NULL
);

#Ability to insert new contacts to Address Book
insert into addressBook(firstName,lastName,address,city,state,zip,phone,email) values
("Niharika","Rao","xyz","Bangalore","Karnataka","560085","9987654321","nih@gmail.com");
insert into addressBook(firstName,lastName,address,city,state,zip,phone,email) values
("Bhavana","Shetty","abc","Bangalore","Karnataka","560090","9934567821","shetty@gmail.com");
describe addressBook;
Select * from addressBook;

#Ability to edit existing contact using their name
update addressBook set address="abcd",city="Hydrabad",state="Andhra",zip="576065",phone="9123456789",email="shetty@gmail.com"
where firstName="Bhavana" and lastName="Shetty";
Select * from addressBook;

#Ability to delete person using their name
delete from addressBook where firstName="Niharika" and lastName="Rao";
select * from addressBook;

#To retreive Persons belonging by city or state
select * from addressBook where city="Hydrabad";
select * from addressBook where state="Andhra";

#To obtain size of Address Book by city or state
select count(*) from addressBook group by city;
select count(*) from addressBook group by state;

#To retreive entries sorted alphabetically by persons name for given city
Select * from addressBook where city ="Bangalore" order by firstName;

#To identify Address Book with name and Type
alter table addressBook add(newName varchar(100), relation varchar(100));
describe addressBook;
UPDATE addressBook SET newName="Bhavana", relation="Colleague" where firstName="Bhavana"; 

insert into addressBook(firstName,lastName,address,city,state,zip,phone,email,newName,relation) values
("Niharika","Rao","xyz","Bangalore","Karnataka","560085","9123465678","nih@gmail.com","Niharika","Friend");
select * from addressBook;

#To obtain number of contact person by type
Select count(*) from addressBook group by relation;

ALTER TABLE addressBook
DROP COLUMN name;
ALTER TABLE addressBook
DROP COLUMN type;
select * from addressBook;