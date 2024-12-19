-- SQL Script: Library Management System Operations
-- This script contains SQL stored procedures usage examples to perform various operations in a library management system. 
-- These operations include opening and closing library branches, adding and removing employees and members, listing and managing books and book copies, issuing and returning books, and managing fines for late returns.
-- Each operation ensures data integrity and maintains archives for audit purposes by following the designed schema of the Library Management System database.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Open a branch
-- Author: @csesohag02
-- CALL OpenBranch('Branch_Address', 'Branch_Contact_Number');
CALL OpenBranch('Joo St Rd', '919549988680');

-- Close a branch
-- Author: @csesohag02
-- CALL CloseBranch('Branch_ID', 'Reason_Of_Close');
CALL CloseBranch('BR100', 'Due to low members, the branch is closed permanently');

-- Add a employee
-- Author: @csesohag02
-- CALL AddEmployee('Employee_Name', 'Employee_Contact_Number', 'Employee_Address', 'For_Position_ID', 'For_Branch_ID');
CALL AddEmployee('John Don', '917891597532', '123 Oak Rd', 'MNGR', 'BR105');

-- Remove a employee
-- Author: @csesohag02
-- CALL RemoveEmployee('Employee_ID', 'Reason_Of_Remove');
CALL RemoveEmployee('CLRK113', 'Left the library');

-- Add a member
-- Author: @csesohag02
-- CALL AddMember('Member_Name', 'Member_Address', 'Member_Contact_Number', 'On_Branch_ID');
CALL AddMember('John Meta', '123 Oak Rd', '917891007532', 'BR105');

-- Remove a member
-- Author: @csesohag02
-- CALL RemoveMember('Member_ID', 'Reason_Of_Remove');
CALL RemoveMember('MBR106', 'Left the library');

-- List a book on book table
-- Author: @csesohag02
-- CALL AddBook('Book_ISBN', 'Book_Title', 'Book_Author', 'Book_Category', 'Book_Language', 'Book_Publish_Year', 'Book_Publisher', 'Book_Price', 'Book_Description_Optional');
CALL AddBook('987-6-54321-098-7', 'Advanced SQL', 'Jane Smith', 'Programming', 'English', 2022, 'Code Publisher', 499.99, NULL);
CALL AddBook('123-4-56789-012-3', 'Learning SQL', 'John Doe', 'Programming', 'English', 2023, 'Tech Publisher', 399.99, 'A comprehensive guide to SQL programming.');

-- Add book copies or list book copies
-- Author: @csesohag02
-- CALL AddBookCopies('Book_ID', 'Branch_ID', 'No_of_Book_Copies');
CALL AddBookCopies('Book_ID', 'Branch_ID', 'No_of_Book_Copies');

-- Remove book copies
-- Author: @csesohag02
-- CALL RemoveBookCopies('Book_Copy_ID', 'Reason_of_Remove');
CALL RemoveBookCopies('Book_Copy_ID', 'Reason_of_Remove');

-- Issue a book copy
-- Author: @csesohag02
-- CALL IssueBook('Member_ID', 'Book_Copy_ID');
CALL IssueBook('MBR100', 'CPY100');

-- Return a book copy
-- Author: @csesohag02
-- CALL ReturnBook('Book_Issue_ID');
CALL ReturnBook('ISU100');

-- Pay late fine
-- Author: @csesohag02
-- CALL PayFine('Fine_ID');
CALL PayFine('FINE100');

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
