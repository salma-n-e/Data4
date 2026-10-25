create database Reservation;
go
use Reservation;
go

DROP TABLE IF EXISTS Hotels;
DROP TABLE IF EXISTS Staff;


CREATE TABLE Staff(
    StaffId INT PRIMARY KEY IDENTITY(5, 5),
    FullName VARCHAR(50) NOT NULL,
    Position VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2)
);


CREATE TABLE Hotels(
    HotelId INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(11) NOT NULL,
    [Address] VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    StarRating INT,
    ManagerId INT UNIQUE REFERENCES Staff(StaffId)
);


Create Table [Services](
ServiceId int primary key,
ServiceName varchar(50) not null,
[change] decimal , 
RequestDate Date ,
staffId int references Staff(StaffId)
)

create Table Rooms(
RoomNumber int Primary key,
RoomType varchar(20) not null , 
[Availability] bit not null,
Dailyrate varchar(10) , 
Capacity int not null , 
HotelId int unique references Hotels(HotelId)
)

Create Table Amenities(
RoomNumber int unique references Rooms(RoomNumber),
Amenity varchar(100) ,
primary key (RoomNumber , Amenity)
)

create Table Guests(
GuestId int primary key identity(5,5),
FullName varchar(50) not null ,
PassportNumber varchar(20) not null ,
Nationality varchar(40) , 
DateOfBirth Date 
)

create Table Guest_Contact_Details(
GuestId int unique references Guests(GuestId),
Detail varchar(100) ,
primary key (GuestId , Detail)
)

create Table payments(
PaymentId int primary key,
Method varchar(20) not null ,
Amount decimal(10,2) , 
payDate Date ,
ConfirmationNumber int not null 
)

create Table Reservations(
ReservationId int primary key , 
BookingDate Date ,
CheckinDate Date not null , 
CheckoutDate Date not null ,
ReservationStatus varchar(50) ,
TotalPrice decimal  ,
NumberOfAdults int ,
NumberOfChildren int 
)


create Table Reservation_Service(
ServiceId int references Services(ServiceId)
)