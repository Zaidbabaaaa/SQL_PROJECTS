-- creating branch_table--
 


	 create table branch(
		  branch_id varchar(20) primary key,
		  manager_id varchar(20),
		  branch_address varchar(100),
		  contact_no varchar(20)
	
	 );

	 

	create table employees(
		emp_id varchar(20) primary key,
		emp_name varchar(50),
		position varchar(20),
		salary int,
		branch_id varchar(20)

	);


	 

	create table books(
		isbn varchar(50) primary key,
		book_title varchar(100),
		category varchar(20),
		rental_price float,
		status varchar(20),
		author varchar(50),
		publisher varchar(100)
				
	);

	
	create table members(
		member_id varchar(15) primary key,
		member_name varchar(20),
		member_address varchar(100),
		reg_date date

	);


	create table issued_status(
		
		issued_id varchar(20) primary key,
		issued_member_id varchar(20),
		issued_book_name varchar(100),
		issued_date date,
		issued_book_isbn varchar(50),
		issued_emp_id varchar(20)
	);

	create table return_status(
		return_id varchar(20) primary key,
		issued_id varchar(20),
		return_book_name varchar(100),
		return_date Date,
		return_book_isbn varchar(50)

	);











	


	

