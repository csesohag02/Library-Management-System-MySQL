-- SQL Script: Library Management System Triggers
-- This script defines triggers for automating ID generation, setting dates, managing the availability of book copies, and ensuring data consistency in the Library Management System database.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Set branch id and establish date
DELIMITER //
CREATE TRIGGER set_branch
BEFORE INSERT ON Branch
FOR EACH ROW
BEGIN
	-- Set branch id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Branch_id, 3)), 99) + 1 FROM Branch);
	SET NEW.Branch_id = CONCAT('BR', next_id);
    
	-- Set establish date
    SET NEW.Established_on = CURDATE();
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Set employee id and joining date
DELIMITER //
CREATE TRIGGER set_employee
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
	-- Set employee id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Emp_id, 5)), 99) + 1 FROM Employee);
	SET NEW.Emp_id = CONCAT(NEW.Position_id, next_id);
    
	-- Set joining date
    SET NEW.Join_on = CURDATE();
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Set member id and registration date
DELIMITER //
CREATE TRIGGER set_member
BEFORE INSERT ON Members
FOR EACH ROW
BEGIN
	-- Set member id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Member_id, 4)), 99) + 1 FROM Members);
	SET NEW.Member_id = CONCAT('MBR', next_id);
    
	-- Set registration date
    SET NEW.Reg_date = CURDATE();
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Set book id
DELIMITER //
CREATE TRIGGER set_book
BEFORE INSERT ON Book
FOR EACH ROW
BEGIN
	-- Set book id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Book_id, 3)), 99) + 1 FROM Book);
	SET NEW.Book_id = CONCAT('BK', next_id);
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Set book copy id and available copies
DELIMITER //
CREATE TRIGGER set_book_copies
BEFORE INSERT ON Book_copies
FOR EACH ROW
BEGIN
	-- Set book copy id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Copy_id, 4)), 99) + 1 FROM Book_copies);
	SET NEW.Copy_id = CONCAT('CPY', next_id);
    
	-- Set available copies
    SET NEW.Available_copies = NEW.No_of_copies;
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Check available copy, set issue id, branch id, book id, issue date, and due date
DELIMITER //
CREATE TRIGGER set_issue_book
BEFORE INSERT ON Issue_book
FOR EACH ROW
BEGIN
	DECLARE next_id INT;
    DECLARE br_id VARCHAR(10);
    DECLARE bk_id VARCHAR(10);
    DECLARE avail_cpy INT;
	SELECT Branch_id, Book_id, Available_copies
    INTO br_id, bk_id, avail_cpy
    FROM Book_copies WHERE Copy_id = NEW.Copy_id;
    
	-- If the copy is not available for issue, throw an error
    IF avail_cpy = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The selected book copy is not available for issue.';
    END IF;
	
	-- Set issue id
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Issue_id, 4)), 99) + 1 FROM Issue_book);
	SET NEW.Issue_id = CONCAT('ISU', next_id);
    -- Set branch id
    SET NEW.Branch_id = br_id;
    -- Set book id
    SET NEW.Book_id = bk_id;
    -- Set issue date
    SET NEW.Issue_date = CURDATE();
    -- Set due date
    SET NEW.Due_date = DATE_ADD(NEW.Issue_date, INTERVAL 30 DAY);
    
    -- Decrease available copies in Book_copies table
    UPDATE Book_copies
    SET Available_copies = Available_copies - 1
    WHERE Copy_id = NEW.Copy_id;
END;
//
DELIMITER ;

-- Author: @csesohag02
-- Set fine id and fine date
DELIMITER //
CREATE TRIGGER set_fine
BEFORE INSERT ON Fine
FOR EACH ROW
BEGIN
	-- Set fine id
	DECLARE next_id INT;
    SET next_id = (SELECT IFNULL(MAX(SUBSTRING(Fine_id, 5)), 99) + 1 FROM Fine);
	SET NEW.Fine_id = CONCAT('FINE', next_id);
    
	-- Set fine date
    SET NEW.Fine_date = CURDATE();
END;
//
DELIMITER ;

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
