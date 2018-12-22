-- To display total flight details
 
SELECT * FROM [airline].[Flights];

-- Inserting Flight details using inser query

INSERT INTO [airline].[Flights] VALUES 
( '102', '2018-12-21', 'Pune' , 'Patna', ' 8:00 AM ' , ' 12:00 PM ' , 145 ,  10000 ),
( '104', '2018-09-11', 'Mumbai' , 'New Delhi', ' 09:00 PM ' , ' 11:00 PM ' , 100 ,  8000 ),
( '110', '2019-08-19', 'Patna' , 'Bangalore', ' 6:00 AM ' , ' 10:00 AM ' , 110 ,  12000 );

-- Inserting Of Flight Details using Procedure

Drop Procedure [airline].[USP_FLIGHTINSERT];

 CREATE PROC [airline].[USP_FLIGHTINSERT]
(
 @flightId varchar(10) ,
 @launchDate date,
 @origin varchar(10),
 @destination varchar(10),
 @deptTime  varchar(10),
 @arrivalTime varchar(10),
 @noOfSeats int)

 As

 BEGIN
		INSERT INTO [airline].[Flights]
							(FlightID, 
							LaunchDate, 
							Origin, 
							Destination, 
							DeptTime, 
							ArrivalTime,
							NoOfSeats 
							) 

			       VALUES (@flightId,
							@launchDate,
							@origin,
							@destination,
							@deptTime,
							@arrivalTime,
							@noOfSeats
							);

	END


	EXEC [airline].[USP_FLIGHTINSERT] '115' , '2020-09-27' , 'Patna' , 'Delhi' , '12:40 PM' , ' 3:00 PM ' , 220  ;  


	-- Deleting a Flight Detail using Stored Procedure

	 CREATE PROC [airline].[USP_FLIGHTDELETE]
    
     @flightId varchar(10) 

     As

     BEGIN
		DELETE FROM [airline].[Flights] WHERE FlightID = @flightId;
      END

     	EXEC [airline].[USP_FLIGHTDELETE] '110' ;  

		SELECT * FROM [airline].[Flights];

	-- Updation a Flight Detail using Stored Procedure

	CREATE PROC [airline].[USP_FLIGHTUPDATE]

    @flightId varchar(10) ,
    @launchDate date,
    @origin varchar(10),
    @destination varchar(10),
    @deptTime  varchar(10),
    @arrivalTime varchar(10),
    @noOfSeats int,
    @fare decimal
    
	 As

        BEGIN
		 UPDATE [airline].[Flights] 
		
		  SET 
		    LaunchDate =   @launchDate,
		 	Origin =   @origin,
			Destination =  @destination,
			DeptTime =   @deptTime ,
            ArrivalTime =  @arrivalTime,
		    NoOfSeats =  @noOfSeats,
			Fare = @fare
							
			WHERE FlightID = @flightId;
      END

     	EXEC [airline].[USP_FLIGHTUPDATE] '110' ;  

		SELECT * FROM [airline].[Flights];


		------------- Procedure to view the Flight Details ---------

		
     CREATE PROC [airline].[USP_VIEWFLIGHTS]
    
     @origin varchar(20),
	 @destination varchar(20)

     As

     BEGIN
		SELECT FlightID, Origin,Destination, DeptTime, ArrivalTime,NoOfSeats FROM [airline].[Flights] WHERE Origin = @origin AND Destination = @destination;
      END

    EXEC [airline].[USP_VIEWFLIGHTS] ' Mumbai ' , ' Dehradun ' ;  

	drop procedure [airline].[USP_VIEWFLIGHTS]




		-------------- Procedures for Users Table -----------

		SELECT * FROM [airline].[Users];

-- var_username = jersey
-- var_password = 123456

-- dont forget to escape for sql injection
-- generate md5sum for password

--var_md5password = md5(password)

--SELECT * FROM users WHERE username = 'var_username' AND password = 'var_md5password'

INSERT INTO [airline].[Users] VALUES( ' ram123 ' , 'abc@1234');

SELECT * FROM [airline].[Users];

CREATE PROC [airline].[USP_USERINSERT]
(
 @userName varchar(10),
 @password varchar(10)
 )

 As

 BEGIN
		INSERT INTO [airline].[Users]
							(Username,
							UserPassword) 

			       VALUES (@userName,
				           @password);

	END


	EXEC [airline].[USP_USERINSERT] 'ratnesh768' , 'rat5643' ;  
	
	EXEC [airline].[USP_USERINSERT] 'zaid567' , 'xyz@123' ; 


	--- Procedure to delete the data in users table -----

  CREATE PROC [airline].[USP_USERDELETE]
    
     @id int

     As

     BEGIN
		DELETE FROM [airline].[Users] WHERE Id = @id;
      END

    EXEC [airline].[USP_USERDELETE] '4' ;  

   SELECT * FROM [airline].[Users];

   ------- Procedure to search a user -------------

   DROP PROCEDURE [airline].[USP_USERSEARCH]

     CREATE PROC [airline].[USP_USERSEARCH]
    
     @userName varchar(20),
	 @password varchar(20)

     As

     BEGIN
		SELECT COUNT(*) FROM [airline].[Users] WHERE Username = @userName AND UserPassword= @password;
      END

    EXEC [airline].[USP_USERSEARCH] 'alam123' , '1234567' ;  

   SELECT * FROM [airline].[Users];


   SELECT FlightID, Origin,Destination, DeptTime, ArrivalTime,NoOfSeats, Fare FROM [airline].[Flights] WHERE Destination = 'BANGALORE'
	SELECT * FROM [airline].[Flights];

	----------Strored procedure for inserting into Reservation-------------------
	drop procedure [airline].[USP_RESERVATIONINSERT]

	CREATE PROC [airline].[USP_RESERVATIONINSERT]
(
  @flightID varchar(10), 
  @dateofBooking date, 
  @journeyDate date, 
  @passengerName varchar(50),
  @age int,
  @gender varchar(10),
  @contacNo bigint,
  @email varchar(70),
  @class varchar(20),
  @noofTickets int, 
  @totalFare decimal,
  @reservationStatus varchar(20))

 As

 BEGIN
		INSERT INTO [airline].Reservation
							( FlightID, 
							  DateofBooking, 
							  JourneyDate, 
							  PassengerName,
							  Age,
							  Gender,
							  ContacNo,
							  Email,
							  Class,
							  NoofTickets, 
							  TotalFare,
							  ReservationStatus) 

			       VALUES (   @flightID, 
							  @dateofBooking, 
							  @journeyDate, 
							  @passengerName,
							  @age,
							  @gender,
							  @contacNo,
							  @email,
							  @class,
							  @noofTickets, 
							  @totalFare,
							  @reservationStatus);

	END

	 EXEC [airline].[USP_RESERVATIONINSERT] 110,'05/20/2017','06/24/2017', 'Bill Gates', 40, 'Male', 8569325478,'bill@hotmail.com','Business Class',1,15000,'Booked'
	 select * from [airline].Reservation

	 ---------------Strored procedure for updating Reservation table------------------------
	 CREATE PROC [airline].[USP_RESERVATIONUPDATE]

   (
   @ticketNo int,
  @flightID varchar(10), 
  @dateofBooking date, 
  @journeyDate date, 
  @passengerName varchar(50),
  @age int,
  @gender varchar(10),
  @contacNo bigint,
  @email varchar(70),
  @class varchar(20),
  @noofTickets int, 
  @totalFare decimal,
  @reservationStatus varchar(20))
    
	 As

        BEGIN
		 UPDATE[airline].[Reservation] 
		
		  SET 
		    FlightID =   @flightID,
		 	DateofBooking =   @dateofBooking,
			JourneyDate =  @journeyDate,
			PassengerName =   @passengerName ,
            Age =  @age,
		    Gender =  @gender,
			ContacNo = @contacNo,
			Email = @email,
			Class	 =  @class,
			NoofTickets	 =  @noofTickets,
			TotalFare	 =  @totalFare,
			ReservationStatus = @reservationStatus
							
			WHERE TicketNo = @ticketNo;
      END
EXEC [airline].[USP_RESERVATIONUPDATE] 3, 110,'05/25/2017','06/30/2017', 'Raju Gates', 20, 'Male', 8569325478,'raju@hotmail.com','Economy Class',1,5000,'Booked' 

-- Deleting a Reservation Detail using Stored Procedure

	 CREATE PROC [airline].[USP_RESERVATIONDELETE]
    
     @ticketNo int 

     As

     BEGIN
		DELETE FROM [airline].[Reservation] WHERE TicketNo = @ticketNo;
      END

     	EXEC [airline].[USP_RESERVATIONDELETE] 5 ;  

	------------- Procedure to view the Tickets Details ---------

		
     CREATE PROC [airline].[USP_VIEWRESERVATION]
    
     @ticketNo int

     As

     BEGIN
		SELECT * FROM [airline].[Reservation] WHERE TicketNo = @ticketNo
      END

EXEC [airline].[USP_VIEWRESERVATION] 3
	   select * from [airline].Reservation

	   ---------------Table creation for Class---------------------
	   Create table airline.FlightClass(
	   FlightID varchar(10),
	   Class varchar(20),
	   Fare decimal,
	    CONSTRAINT FK_FlightClass FOREIGN KEY (FlightID)
    REFERENCES airline.Flights(FlightID)
	);
	select * from airline.Flights
	select * from airline.FlightClass

	Insert into airline.FlightClass values(109,'Business Class',15000)
	Insert into airline.FlightClass values(109,'First Class',10000)
	Insert into airline.FlightClass values(109,'Economy Class',15000)

	Insert into airline.FlightClass values(110,'Business Class',15000)
	Insert into airline.FlightClass values(110,'First Class',10000)
	Insert into airline.FlightClass values(110,'Economy Class',15000)

	Insert into airline.FlightClass values(101,'Business Class',15000)
	Insert into airline.FlightClass values(101,'First Class',10000)
	Insert into airline.FlightClass values(101,'Economy Class',15000)