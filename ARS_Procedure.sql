
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






 ------------- Stored procedure for 
	
	 



































