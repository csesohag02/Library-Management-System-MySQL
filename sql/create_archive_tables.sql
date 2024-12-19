-- SQL Script: Library Management System Archive Tables Creation
-- This script creates archive tables for branches, employees, members, and book copies. 
-- These tables are used for storing historical or archived data for entities in the Library Management System.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Create branch archive table
-- Author: @csesohag02
CREATE TABLE Branch_archive(
    Branch_id VARCHAR(10) NOT NULL,
    Branch_address VARCHAR(30) NOT NULL,
    Contact_no VARCHAR(15) NOT NULL,
    Established_on DATE NOT NULL,
    Archived_on DATE NOT NULL,
    Archive_reason VARCHAR(200) NOT NULL,
    PRIMARY KEY(Branch_id)
);

-- Create employee archive table
-- Author: @csesohag02
CREATE TABLE Employee_archive(
    Emp_id VARCHAR(10) NOT NULL,
    Emp_name VARCHAR(30) NOT NULL,
    Contact_no VARCHAR(15) NOT NULL,
    Emp_address VARCHAR(30) NOT NULL,
    Position_id VARCHAR(5) NOT NULL,
    Branch_id VARCHAR(10) NOT NULL,
    Join_on DATE NOT NULL,
    Archived_on DATE NOT NULL,
    Archive_reason VARCHAR(200) NOT NULL,
    PRIMARY KEY(Emp_id)
);

-- Create member archive table
-- Author: @csesohag02
CREATE TABLE Member_archive(
    Member_id VARCHAR(10) NOT NULL,
    Member_name VARCHAR(30) NOT NULL,
    Member_address VARCHAR(30) NOT NULL,
    Contact_no VARCHAR(15) NOT NULL,
    Branch_id VARCHAR(10) NOT NULL,
    Reg_date DATE NOT NULL,
    Archived_on DATE NOT NULL,
    Archive_reason VARCHAR(200) NOT NULL,
    PRIMARY KEY(Member_id)
);

-- Create table archive book copies
-- Author: @csesohag02
CREATE TABLE Book_copies_archive(
    Copy_id VARCHAR(10) NOT NULL,
    Book_id VARCHAR(10) NOT NULL,
    Branch_id VARCHAR(10) NOT NULL,
    No_of_copies INT NOT NULL,
    Archived_on DATE NOT NULL,
    Archive_reason VARCHAR(200) NOT NULL,
    PRIMARY KEY(Copy_id)
);

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
