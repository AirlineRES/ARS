-- Creating tables for Airline reservation system
-- Created by Sayali Chincholikar
-- Created on 15/12/2018

create schema airline

/*
create table airline.Flights
(
 FlightID varchar(10), 
 LaunchDate date, 
 Origin varchar(10), 
 Destination varchar(10), 
 DeptTime varchar(10), 
 ArrivalTime varchar(10),
 NoOfSeats int, 
 Fare decimal
 );

 Create table airline.Reservation
 (
  TicketNo int identity, 
  FlightID varchar(10), 
  DateofBooking date, 
  JourneyDate date, 
  PassengerName varchar(50),
  ContacNo bigint,
  Email varchar(70),
  NoofTickets int, 
  TotalFare decimal,
  ReservationStatus varchar(20) --Staus will have either of the following values Booked or Cancelled
);

Create table airline.Users
(
 Id int identity, 
 Username varchar(30),
 UserPassword varchar(30)
);
*/

create table airline.Flights
(
 FlightID varchar(10) primary key, 
 LaunchDate date, 
 Origin varchar(10), 
 Destination varchar(10), 
 DeptTime varchar(10), 
 ArrivalTime varchar(10),
 NoOfSeats int, 
 Fare decimal
 );


 Create table airline.Reservation
 (
  --TicketNo int identity primary key, 
   TicketNumber INT IDENTITY(1,40) NOT NULL PRIMARY KEY CLUSTERED,
   TicketNo AS 'CG' + RIGHT('000000' + CAST(TicketNumber AS VARCHAR(8)), 8) PERSISTED,
  FlightID varchar(10), 
  DateofBooking date, 
  JourneyDate date, 
  PassengerName varchar(50),
  Age int,
  Gender varchar(10),
  ContacNo bigint,
  Email varchar(70),
  Class varchar(20),
  NoofTickets int, 
  TotalFare decimal,
  ReservationStatus varchar(20), --Staus will have either of the following values Booked or Cancelled
  constraint CHK_Gender check(Gender IN ('Male','Female')),
  constraint CHK_Class check(Class IN ('First Class','Business Class','Economy Class')),
  constraint CHK_Status check(ReservationStatus IN ('Booked','Cancelled')),
  constraint FK_FlightID foreign key(FlightID) 
  references airline.Flights(FlightID)
);
--exec sp_help [airline.users];
drop table airline.Reservation
select * from airline.Reservation
Create table airline.Users
(
 Id int identity primary key, 
 Username varchar(30),
 UserPassword varchar(30)
);
select * from airline.Reservation
select * from airline.Flights

insert into airline.Reservation values('101','05/18/2017','06/14/2017', 'John Mellen', 40, 'Male', 8569325478,'john@gmail.com','Economy Class',1,5000,'Booked')

insert into airline.Reservation values('109','08/18/2017','10/14/2017', 'Johny Boosh', 30, 'Male', 8569325478,'johny@gmail.com','Business Class',1,10000,'Booked')

select * from airline.Flights
alter table airline.Flights drop column Fare
select * from airline.Reservation

delete from airline.Reservation where TicketNo = 'CG00000041'
-----------------Fare fetching from Class table------------------------

select * from airline.Flights
select * from airline.Reservation
select * from airline.FlightClass



select a.FlightID, b.Class, b.Fare from airline.Flights a inner join airline.FlightClass b
on a.FlightID = b.FlightID

-------------deleting records of flight----------------------------
