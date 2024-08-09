create database library;
use library;
create table Branch(Branch_no int primary key,
Manager_id int,
Branch_address varchar(50),
contact_no bigint unique);
create table Employee(Emp_id int primary key,
Emp_name varchar(25),
Position varchar(15),
Salary int(15),
Branch_no int,
foreign key(Branch_no) references Branch(Branch_no )
);
create table Books(ISBN varchar(20) primary key,
Book_title varchar(50),
Category varchar(20),
Rental_price int,
status enum('yes','no'),
Author varchar(50),
Publisher varchar(25)
);
create table Customer(Customer_id int primary key,
Customer_name varchar(30),
Customer_address varchar(50),
Reg_date date);
create table IssueStatus(Issue_id int primary key,
Issued_cust int,
foreign key (issued_cust) references customer(customer_id),
Issued_book_name varchar(50),
Issue_date date,
Isbn_book varchar(25),
foreign key (isbn_book) references books(isbn)
);
create table ReturnStatus(Return_id int primary key,
Return_cust int,
Return_book_name varchar(50),
Return_date date,
Isbn_book2 varchar(50),
foreign key (isbn_book2) references books(isbn)
);
insert into branch(branch_no,manager_id,branch_address,contact_no) values
(1,101, '123 Library St, City Center','3452355552'),  
(2,102, '456 East St, Eastside','234567891'),  
(3,103, '789 West St, Westside','1432568967'),
(4,104, '987 Main block,southside','9867766223'),
(5,105, '543 C BLOCK, S CITY','655588524');  

Insert into employee(emp_id,emp_name,position,salary,branch_no) values 
(1, 'Alice Johnson', 'Manager', 60000, 1),  
(2, 'Bob Smith', 'Librarian', 45000, 1),  
(3, 'Charlie Brown', 'Assistant', 30000, 2),  
(4, 'Diana Prince', 'Manager', 70000, 2),  
(5, 'Ethan Hunt', 'Librarian', 50000, 3);

insert into books(isbn,book_title,category,rental_price,status,author,publisher) values
('978-3-16-148410', 'The Great Gatsby', 'Fiction', 20.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),  
('978-1-4028', '1984', 'Dystopian', 15.00, 'yes', 'George Orwell', 'Secker & Warburg'),  
('978-0-7432', 'To Kill a Mockingbird', 'Classic', 30.00, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),  
('978-0-06-112008-4', 'History of the World', 'History', 25.00, 'yes', 'J.M. Roberts', 'HarperCollins'),
('978-2-2065-09','The Last Page','Fiction',299.0,'no','Emily J.Miller','Greenleaf');  

insert into customer(customer_id,customer_name,customer_address,reg_date) values
(1, 'John Doe', '100 Maple St', '2021-06-01'),  
(2, 'Mary Smith', '200 Oak St', '2020-12-15'),  
(3, 'James Bond', '300 Pine St', '2022-03-20'),  
(4, 'Emma Watson', '400 Birch St', '2021-05-10'),
(5,'Emily Miller','305 s city','2022-04-25');

insert into issuestatus(issue_id,issued_cust,issued_book_name,issue_date,isbn_book) values
(1, 1, 'The Great Gatsby', '2023-05-01', '978-3-16-148410'),  
(2, 2, '1984', '2023-06-12', '978-1-4028'),  
(3, 3, 'History of the World', '2023-06-15', '978-0-06-112008-4');  

insert into returnstatus(return_id,return_cust,return_book_name,return_date,isbn_book2) values
(1, 1, 'The Great Gatsby', '2023-05-15', '978-3-16-148410'),  
(2, 2, '1984', '2023-06-20', '978-1-4028');    

select book_title,category,rental_price from books where status ='yes';
select emp_name,salary from employee order by salary desc;
select i.issued_book_name as 'book_name',c.customer_name
from issuestatus i
left join customer c on i.issued_cust=c.customer_id;
SELECT Category, COUNT(*) AS Total_Books   
FROM Books   
GROUP BY Category; 
select emp_name,position from employee where
salary >50000;
select customer_name from customer
where reg_date < '2022-01-01'
and customer_id not in (select issued_cust from issuestatus);
select b.branch_no,count(*) as 'total_employee'
from branch b
left join employee e on b.branch_no=e.branch_no
group by b.branch_no;
select customer_name from issuestatus i
inner join customer c on i.issued_cust=c.customer_id
where i.issue_date between '2023-06-01' and '2023-06-30';
select book_title from books
where category='History';
select b.branch_no,count(*) as 'count_of_employees'
from branch b
left join employee e
on b.branch_no = e.branch_no
group by b.branch_no
having count(*) > 5;
select e.emp_name,e.branch_no,b.branch_address
from employee e
inner join branch b on e.branch_no = b.branch_no
where e.position ='Manager';
select c.customer_name from customer c
inner join issuestatus i on c.customer_id =i.issued_cust
inner join books b on i.isbn_book = b.isbn
where b.rental_price > 25;









