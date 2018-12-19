-- To display total flight details
 
SELECT * FROM [airline].[Flights];

-- Inserting Flight details using inser query

INSERT INTO [airline].[Flights] VALUES 
( '102', '2018-12-21', 'Pune' , 'Patna', ' 8:00 AM ' , ' 12:00 PM ' , 145 ,  10000 ),
( '104', '2018-09-11', 'Mumbai' , 'New Delhi', ' 09:00 PM ' , ' 11:00 PM ' , 100 ,  8000 ),
( '110', '2019-08-19', 'Patna' , 'Bangalore', ' 6:00 AM ' , ' 10:00 AM ' , 110 ,  12000 );

-- Inserting Of Flight Details using Procedure

 CREATE PROC [airline].[USP_FLIGHTINSERT]
(
 @flightId varchar(10) ,
 @launchDate date,
 @origin varchar(10),
 @destination varchar(10),
 @deptTime  varchar(10),
 @arrivalTime varchar(10),
 @noOfSeats int,
 @fare decimal)

 As

 BEGIN
		INSERT INTO [airline].[Flights]
							(FlightID, 
							LaunchDate, 
							Origin, 
							Destination, 
							DeptTime, 
							ArrivalTime,
							NoOfSeats, 
							Fare) 

			       VALUES (@flightId,
							@launchDate,
							@origin,
							@destination,
							@deptTime,
							@arrivalTime,
							@noOfSeats,
							@fare);

	END


	EXEC [airline].[USP_FLIGHTINSERT] '101' , '2020-05-21' , ' Delhi ' , ' Pune ' , ' 12:00 PM' , ' 4:00 PM ' , 200 , 9000 ;  


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
		SELECT FlightID, Origin,Destination, DeptTime, ArrivalTime,NoOfSeats, Fare FROM [airline].[Flights] WHERE Origin = @origin AND Destination = @destination;
      END

    EXEC [airline].[USP_VIEWFLIGHTS] 'Mumbai' , 'Dehradun' ;  

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

     CREATE PROC [airline].[USP_USERSEARCH]
    
     @userName varchar(20),
	 @password varchar(20)

     As

     BEGIN
		SELECT Username, UserPassword FROM [airline].[Users] WHERE Username = @userName AND UserPassword= @password;
      END

    EXEC [airline].[USP_USERSEARCH] 'alam123' , '1234567' ;  

   SELECT * FROM [airline].[Users];


   SELECT FlightID, Origin,Destination, DeptTime, ArrivalTime,NoOfSeats, Fare FROM [airline].[Flights] WHERE Destination = 'BANGALORE'




		SELECT * FROM [airline].[Flights];
