use Reservation;
go


insert into Guests (FullName , PassportNumber , Nationality , DateOfBirth)
values ('Salma Ahmed','A12345678' ,'Egyptian', '2005-05-15') ,
('Ahmed Samy Allam' , '202456784' , 'Italian' , '1998-02-18'),
('Ali Ahmed Mosa' , '202367546' , 'Egyptian','1999-12-10')

update Rooms
set Dailyrate += (Dailyrate*0.15)

update Reservations
set ReservationStatus = case 
						when CheckoutDate < GETDATE() then 'Completed'
						when CheckoutDate > GETDATE() then 'Upcoming'
						else 'Active'
						end