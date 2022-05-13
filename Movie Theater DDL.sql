--Making database based on created ERD for movie theater
create table movies(
	movie_id serial primary key,
	film_title varchar(15) not null,
	synopsis varchar(50),
	rating varchar(5),
	runtime numeric (5,2)
);

create table concessions(
	concession_id serial primary key,
	item_name varchar(15),
	item_cost numeric(4,2)
)

create table tickets(
	ticket_id serial primary key,
	movie_id integer,
	foreign key(movie_id) references movies(movie_id),
	ticket_cost numeric(4,2)
)

create table customers(
	customer_id serial primary key,
	first_name varchar(10),
	last_name varchar(20) not null,
	ticket_id integer,
	foreign key(ticket_id) references tickets(ticket_id),
	tix_purchased integer not null	
)

create table buy_concessions(
	ticket_con_id serial primary key,
	customer_id integer,
	foreign key(customer_id) references customers(customer_id),
	concession_id integer,
	foreign key(concession_id) references concessions(concession_id)
)

--Nice! Tables created. Lets add some values.

insert into movies(film_title,synopsis,rating,runtime)
values('Inception', 'Mind bending space thriller that doesnt add up','PG-13',148.00),
	('Cheetah Girls','Never seen it, added per fiancee request.','G',100.00),
	('Spongebob', 'Teen sponge saves town from an enslaving plankton','PG',87.00);

insert into concessions(item_name,item_cost)
values('Butter Popcorn',15.50),
	('Cheezy Popcorn', 15.59),
	('Whoppers', 5.99),
	('Soda', 8.99),
	('SourPatchKids',12.99)
	
insert into tickets(ticket_cost)
values(21.99),
	(19.99),
	(25.99)

insert into customers(first_name,last_name,tix_purchased)
values('Joel','Piroe', 4),
	('Kyle','Naughton',0),
	('Ben','Cabango',0),
	('Olivier', 'Ntcham',0)



