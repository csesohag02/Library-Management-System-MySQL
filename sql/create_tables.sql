-- create branch table
CREATE TABLE Branch(
Branch_id VARCHAR(10) NOT NULL,
Branch_address VARCHAR(30) NOT NULL,
Contact_no VARCHAR(15) NOT NULL,
Established_on DATE NOT NULL,
PRIMARY KEY(Branch_id)
);


-- create position details table
CREATE TABLE Employee_position(
Position_id VARCHAR(5) NOT NULL,
Position_name VARCHAR(20) NOT NULL,
Position_salary DECIMAL(10, 2) NOT NULL,
PRIMARY KEY(Position_id)
);


-- create employee table
CREATE TABLE Employee(
Emp_id VARCHAR(10) NOT NULL,
Emp_name VARCHAR(30) NOT NULL,
Contact_no VARCHAR(15) NOT NULL,
Emp_address VARCHAR(30) NOT NULL,
Position_id VARCHAR(5) NOT NULL,
Branch_id VARCHAR(10) NOT NULL,
Join_on DATE NOT NULL,
PRIMARY KEY(Emp_id),
FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);


-- create members table
CREATE TABLE Members(
Member_id VARCHAR(10) NOT NULL,
Member_name VARCHAR(30) NOT NULL,
Member_address VARCHAR(30) NOT NULL,
Contact_no VARCHAR(15) NOT NULL,
Branch_id VARCHAR(10) NOT NULL,
Reg_date DATE NOT NULL,
PRIMARY KEY(Member_id),
FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);


-- create book table
CREATE TABLE Book(
Book_id VARCHAR(10) NOT NULL,
ISBN VARCHAR(20) NOT NULL,
Book_title VARCHAR(100) NOT NULL,
Author VARCHAR(50) NOT NULL,
Category VARCHAR(30) NOT NULL,
Book_language VARCHAR(20) NOT NULL,
Publication_year INT NOT NULL,
Publisher VARCHAR(50) NOT NULL,
Price DECIMAL(6, 2) NOT NULL,
Book_description TEXT DEFAULT NULL,
PRIMARY KEY(Book_id)
);


-- create table book copies
CREATE TABLE Book_copies(
Copy_id VARCHAR(10) NOT NULL,
Book_id VARCHAR(10) NOT NULL,
Branch_id VARCHAR(10) NOT NULL,
No_of_copies INT NOT NULL,
Available_copies INT NOT NULL,
PRIMARY KEY(Copy_id),
FOREIGN KEY(Book_id) REFERENCES Book(Book_id),
FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id)
);


-- create issue book table
CREATE TABLE Issue_book(
Issue_id VARCHAR(10) NOT NULL,
Branch_id VARCHAR(10) NOT NULL,
Member_id VARCHAR(10) NOT NULL,
Book_id VARCHAR(10) NOT NULL,
Copy_id VARCHAR(10) NOT NULL,
Issue_date DATE NOT NULL,
Due_date DATE NOT NULL,
PRIMARY KEY(Issue_id),
FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id),
FOREIGN KEY(Member_id) REFERENCES Members(Member_id),
FOREIGN KEY(Book_id) REFERENCES Book(Book_id),
FOREIGN KEY(Copy_id) REFERENCES Book_copies(Copy_id)
);


-- create fine table
CREATE TABLE Fine(
Fine_id VARCHAR(10) NOT NULL,
Member_id VARCHAR(10) NOT NULL,
Copy_id VARCHAR(10) NOT NULL,
Late_days INT NOT NULL,
Fine_amount DECIMAL(6,2) NOT NULL,
Fine_date DATE NOT NULL,
PRIMARY KEY(Fine_id),
FOREIGN KEY(Member_id) REFERENCES Members(Member_id),
FOREIGN KEY(Copy_id) REFERENCES Book_copies(Copy_id)
);

