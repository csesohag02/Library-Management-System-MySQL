-- SQL Script: Library Management System Procedures
-- This script defines procedures for various operations in the Library Management System. 
-- Includes procedures for managing branches, employees, members, books, book copies, and related operations.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Procedure: OpenBranch - Opens a new branch by inserting its details into the Branch table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE OpenBranch(IN br_add VARCHAR(30), IN cont_no VARCHAR(15))
BEGIN
	-- insert into Branch table
    INSERT INTO Branch(Branch_address, Contact_no)
    VALUES(br_add, cont_no);
END;
//
DELIMITER ;


-- Procedure: CloseBranch - Archives and removes a branch along with its associated records.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE CloseBranch(IN Branch_to_close VARCHAR(10), IN Close_reason VARCHAR(200))
BEGIN
    DECLARE issueCount INT;
    
    -- check if any books are issued from the branch
    SELECT COUNT(*) INTO issueCount FROM Issue_book WHERE Branch_id = Branch_to_close;
    
    -- if books are still issued, terminate the procedure
    IF issueCount > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot close branch because books are still issued.';
    END IF;
	
    -- archive employees associated with the branch
	INSERT INTO Employee_archive(Emp_id, Emp_name, Contact_no, Emp_address, Position_id, Branch_id, Join_on, Archived_on, Archive_reason)
	SELECT Emp_id, Emp_name, Contact_no, Emp_address, Position_id, Branch_id, Join_on, CURDATE(), Close_reason
	FROM Employee WHERE Branch_id = Branch_to_close;
	
    -- delete employees associated with the branch from Employee table
	DELETE FROM Employee WHERE Branch_id = Branch_to_close;

	-- archive members associated with the branch
	INSERT INTO Member_archive(Member_id, Member_name, Member_address, Contact_no, Branch_id, Reg_date, Archived_on, Archive_reason)
	SELECT Member_id, Member_name, Member_address, Contact_no, Branch_id, Reg_date, CURDATE(), Close_reason
	FROM Members WHERE Branch_id = Branch_to_close;
	
    -- delete members associated with the branch from Members table
	DELETE FROM Members WHERE Branch_id = Branch_to_close;

	-- archive book copies associated with the branch
	INSERT INTO Book_copies_archive(Copy_id, Book_id, Branch_id, No_of_copies, Archived_on, Archive_reason)
	SELECT Copy_id, Book_id, Branch_id, No_of_copies, CURDATE(), Close_reason
	FROM Book_copies WHERE Branch_id = Branch_to_close;
	
    -- delete book copies associated with the branch from Book_copies table
	DELETE FROM Book_copies WHERE Branch_id = Branch_to_close;

	-- archive the branch itself
	INSERT INTO Branch_archive(Branch_id, Branch_address, Contact_no, Established_on, Archived_on, Archive_reason)
	SELECT Branch_id, Branch_address, Contact_no, Established_on, CURDATE(), Close_reason
	FROM Branch WHERE Branch_id = Branch_to_close;
	
    -- delete the branch from Branch table
	DELETE FROM Branch WHERE Branch_id = Branch_to_close;
END;
//
DELIMITER ;


-- Procedure: AddEmployee - Adds a new employee to the Employee table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE AddEmployee(IN emp_nm VARCHAR(30), IN cont_no VARCHAR(15), IN emp_addr VARCHAR(30), IN pos_id VARCHAR(5), IN br_id VARCHAR(10))
BEGIN
	-- insert into Employee table
    INSERT INTO Employee(Emp_name, Contact_no, Emp_address, Position_id, Branch_id)
    VALUES(emp_nm, cont_no, emp_addr, pos_id, br_id);
END;
//
DELIMITER ;


-- Procedure: RemoveEmployee - Archives and removes an employee from the Employee table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE RemoveEmployee(IN Emp_remove VARCHAR(10), IN Remove_reason VARCHAR(200))
BEGIN
    -- archive the employee before removal
	INSERT INTO Employee_archive(Emp_id, Emp_name, Contact_no, Emp_address, Position_id, Branch_id, Join_on, Archived_on, Archive_reason)
	SELECT Emp_id, Emp_name, Contact_no, Emp_address, Position_id, Branch_id, Join_on, CURDATE(), Remove_reason
	FROM Employee WHERE Emp_id = Emp_remove;
	
    -- delete the employee from the Employee table
	DELETE FROM Employee WHERE Emp_id = Emp_remove;
END;
//
DELIMITER ;


-- Procedure: AddMember - Adds a new member to the Members table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE AddMember(IN mem_nm VARCHAR(30), IN mem_addr VARCHAR(30), IN cont_no VARCHAR(15), IN br_id VARCHAR(10))
BEGIN
	-- insert into Member table
    INSERT INTO Members(Member_name, Member_address, Contact_no, Branch_id)
    VALUES(mem_nm, mem_addr, cont_no, br_id);
END;
//
DELIMITER ;


-- Procedure: RemoveMember - Archives and removes a member from the Members table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE RemoveMember(IN Member_remove VARCHAR(10), IN Remove_reason VARCHAR(200))
BEGIN
	DECLARE BookIssued INT;
    DECLARE OutstandingFines INT;
    
    -- check if the member has issued any books in the Issue_book table
    SELECT COUNT(*) INTO BookIssued FROM Issue_book WHERE Member_id = Member_remove;
    
    -- check if the member has any outstanding fines in the Fine table
    SELECT COUNT(*) INTO OutstandingFines FROM Fine WHERE Member_id = Member_remove;
    
    -- if books are issued, prevent deletion and signal an error
    IF BookIssued > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot remove member. Books are currently issued.';
	
    -- if there are outstanding fines, prevent deletion and signal an error
    ELSEIF OutstandingFines > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot remove member. Outstanding fines exist.';
    END IF;
	
    -- archive the member before removal
	INSERT INTO Member_archive(Member_id, Member_name, Member_address, Contact_no, Branch_id, Reg_date, Archived_on, Archive_reason)
	SELECT Member_id, Member_name, Member_address, Contact_no, Branch_id, Reg_date, CURDATE(), Remove_reason
	FROM Members WHERE Member_id = Member_remove;
	
    -- delete the member from the Members table
	DELETE FROM Members WHERE Member_id = Member_remove;
END;
//
DELIMITER ;


-- Procedure: AddBook - Adds a new book to the Book table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE AddBook(IN isbn_id VARCHAR(20), IN bk_title VARCHAR(100), IN bk_auth VARCHAR(50), IN bk_catg VARCHAR(30), IN bk_lang VARCHAR(20), IN bk_pub_yr INT, IN bk_publi VARCHAR(50), IN bk_price DECIMAL(6, 2), IN bk_des TEXT)
BEGIN
	-- insert into book table
    INSERT INTO Book(ISBN, Book_title, Author, Category, Book_language, Publication_year, Publisher, Price, Book_description)
    VALUES(isbn_id, bk_title, bk_auth, bk_catg, bk_lang, bk_pub_yr, bk_publi, bk_price, bk_des);
END;
//
DELIMITER ;


-- Procedure: AddBookCopies - Adds or updates book copies in the Book_copies table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE AddBookCopies(IN bk_id VARCHAR(10), IN br_id VARCHAR(10), IN copies_no INT)
BEGIN
    DECLARE current_copies INT;
    
    -- check if the book and branch combination already exists in the Book_copies table
    SELECT No_of_copies INTO current_copies
    FROM Book_copies
    WHERE Book_id = bk_id AND Branch_id = br_id;
    
    -- if the combination exists, update both No_of_copies and Available_copies
    IF current_copies IS NOT NULL THEN
        UPDATE Book_copies
        SET
            No_of_copies = No_of_copies + copies_no,
            Available_copies = Available_copies + copies_no
        WHERE Book_id = bk_id AND Branch_id = br_id;
    
    -- if the combination does not exist, insert a new row
    ELSE
        INSERT INTO Book_copies(Book_id, Branch_id, No_of_copies, Available_copies)
        VALUES (bk_id, br_id, copies_no, copies_no);
    END IF;
END;
//
DELIMITER ;


-- Procedure: RemoveBookCopies - Archives and removes book copies from the Book_copies table.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE RemoveBookCopies(IN cpy_id VARCHAR(10), IN archive_reason VARCHAR(200))
BEGIN
    -- archive the book copy into Book_copies_archive
    INSERT INTO Book_copies_archive(Copy_id, Book_id, Branch_id, No_of_copies, Archived_on, Archive_reason)
    SELECT Copy_id, Book_id, Branch_id, No_of_copies, CURDATE(), archive_reason
    FROM Book_copies
    WHERE Copy_id = cpy_id;
    
    -- remove the book copy from the Book_copies table
    DELETE FROM Book_copies
    WHERE Copy_id = cpy_id;
END;
//
DELIMITER ;


-- Procedure: IssueBook - Issues a book copy to a member.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE IssueBook(IN mem_id VARCHAR(10), IN cpy_id VARCHAR(10))
BEGIN
    -- insert into Issue_book table
    INSERT INTO Issue_book(Member_id, Copy_id)
    VALUES(mem_id, cpy_id);
END;
//
DELIMITER ;


-- Procedure: ReturnBook - Handles the return of an issued book, including fine calculation.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE ReturnBook(IN isu_id VARCHAR(10))
BEGIN
    DECLARE cpy_id VARCHAR(10);
    DECLARE mbr_id VARCHAR(10);
    DECLARE due_dt DATE;
    DECLARE lt_days INT;
    DECLARE fine_amnt DECIMAL(6,2);
    SELECT Copy_id, Member_id, Due_date
    INTO cpy_id, mbr_id, due_dt
    FROM Issue_book WHERE Issue_id = isu_id;
    
    -- calculate late days and fine if returned after the due date
    SET lt_days = DATEDIFF(CURDATE(), due_dt);
    IF lt_days > 0 THEN
        SET fine_amnt = lt_days * 3;
        -- insert fine details into the Fine table
        INSERT INTO Fine(Member_id, Copy_id, Late_days, Fine_amount)
        VALUES (mbr_id, cpy_id, lt_days, fine_amnt);
    END IF;

    -- increment available copies in Book_copies table
    UPDATE Book_copies
    SET Available_copies = Available_copies + 1
    WHERE Copy_id = cpy_id;
    
    -- delete the record from Issue_book table
    DELETE FROM Issue_book
    WHERE Issue_id = isu_id;
END;
//
DELIMITER ;


-- Procedure: PayFine - Marks a fine as paid by deleting the fine record.
-- Author: @csesohag02
DELIMITER //
CREATE PROCEDURE PayFine(IN pay_fine_id VARCHAR(10))
BEGIN
    -- delete the record from the fine table
    DELETE FROM Fine WHERE Fine_id = pay_fine_id;
END;
//
DELIMITER ;

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
