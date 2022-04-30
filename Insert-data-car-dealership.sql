create or replace function addCustomer (
	_first_name VARCHAR(255),
	_last_name VARCHAR(255)
)
returns void
as $main$
begin 
	insert into customers (first_name, last_name)
	values (_first_name, _last_name);
end;
$main$
language plpgsql;


select addCustomer ('Loc', 'Tran')	-- calling a stored function
select addCustomer ('John', 'Doe') 

update customers 
set first_name = 'Jane'
where customer_id = 3


select *
from customers 

create or replace function addCar (
	_brand VARCHAR(255),
	_model VARCHAR(255),
	_year int, 
	_serial_number int, 
	_customer_id int
)
returns void
as $main$
begin 
	insert into cars (brand, model, year, serial_number, customer_id)
	values (_brand, _model, _year, _serial_number, _customer_id);
end;
$main$
language plpgsql;

select addCar ('Hyundai', 'Tuscon', 2015, 123456789, 1)	-- calling a stored function
select addCar ('Toyota', 'Camry', 200, 293049587, 2)
select addCar ('Honda', 'Odyssey', 2004, 1029384759, 3)

select * 
from cars 

update cars 
set year = 2000
where car_id = 2

insert into mechanics (first_name, last_name)
values
('Ken', 'Jennings'),
('Brad', 'Rutter'),

insert into mechanics_to_cars (mechanics_id, car_id)
values
(1, 1),
(1, 2),
(2, 1),
(2, 2)

insert into service_history (date, serial_number)
values
(now()::timestamp, 1029384759),
(now()::timestamp, 123456789)

select first_name, last_name, brand, model
from cars
join customers on customers.customer_id = cars.customer_id 

insert into invoices (amount, date, customer_id, car_id)
values 
(20000, now()::timestamp, 1, 1),
(21000, now()::timestamp, 3, 3)

delete from invoices 
where invoice_id = 3

insert into sales_person (first_name, last_name, invoice_id )
values
('Alex', 'Trebek', 1),
('Alex', 'Trebek', 2),
('James', 'Holzhauer', 1) -- I was testing if a new sales person could use the same invoice_id serial
						  -- it got added, and I don't get why serial doesn't apply to this column
						  -- does the foreign key need to be a unique input type? 
						  -- also wondering how to show the same sales person (id=1) sold cars 1 and 2
delete from sales_person 
where sales_person_id = 3

insert into service_tickets (service_type, customer_id, car_id)
values 
('oil change', 1, 1),	-- service doesn't need parts
('new tires', 2, 2)

insert into parts (part_name, quantity, amount, service_ticket_id)
values 
('tires', 4, 400, 2)


