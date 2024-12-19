-- SQL Script: Library Management System Table Creation
-- This script creates the required tables for the Library Management System database. 
-- It defines the schema for branches, employee positions, employees, members, books, book copies, book issue records, and fines.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Table 1 - Branch : Stores information about library branches.
-- Author: @csesohag02
CREATE TABLE Branch(
    Branch_id VARCHAR(10) NOT NULL,
    Branch_address VARCHAR(30) NOT NULL,
    Contact_no VARCHAR(15) NOT NULL,
    Established_on DATE NOT NULL,
    PRIMARY KEY(Branch_id)
);

-- Table 2 - Employee_position : Stores position details and salaries for employees.
-- Author: @csesohag02
CREATE TABLE Employee_position(
    Position_id VARCHAR(5) NOT NULL,
    Position_name VARCHAR(20) NOT NULL,
    Position_salary DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(Position_id)
);

-- Table 3 - Employee : Stores employee details, including assigned branch and position.
-- Author: @csesohag02
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

-- Table 4 - Members : Stores library member details, including registration date and branch association.
-- Author: @csesohag02
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

-- Table 5 - Book : Stores information about books available in the library.
-- Author: @csesohag02
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

-- Table 6 - Book_copies : Tracks the number of copies of a book at specific branches.
-- Author: @csesohag02
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

-- Table 7 - Issue_book : Tracks book issuance records, including due dates and issued copies.
-- Author: @csesohag02
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

-- Table 8 - Fine : Tracks fines incurred by members for overdue book returns.
-- Author: @csesohag02
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

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
