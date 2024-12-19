-- SQL Script: Sample Data Insertion for Library Management System
-- This script populates the Library Management System database with sample data for branches, employee positions, employees, members, books, and book copies. 
-- It is designed for testing and demonstration purposes.
-- Author: @csesohag02
-- GitHub: https://github.com/csesohag02

-- Insert data into the Branch table
INSERT INTO Branch(Branch_address, Contact_no) VALUES
('123 Main St', '919099988676'),
('456 Elm St', '919099988677'),
('789 Oak St', '919099988678'),
('567 Pine St', '919099988679'),
('890 Maple St', '919099988680');

-- Author: @csesohag02
-- Insert data into the Employee_position table
INSERT INTO Employee_position(Position_id, Position_name, Position_salary) VALUES
('MNGR', 'Manager', 65000),
('LIBR', 'Librarian', 55000),
('ASST', 'Assistant', 50000),
('CLRK', 'Clerk', 45000);

-- Author: @csesohag02
-- Insert data into the Employee table
INSERT INTO Employee(Emp_name, Contact_no, Emp_address, Position_id, Branch_id) VALUES
('John Doe', '919099900676', '123 Main St', 'MNGR', 'BR100'),
('Jane Smith', '919099925676', '456 Elm St', 'LIBR', 'BR102'),
('Mike Johnson', '917899900676', '789 Oak St', 'MNGR', 'BR101'),
('Emily Davis', '919095600676', '567 Pine St', 'LIBR', 'BR103'),
('Sarah Brown', '919099962676', '890 Maple St', 'LIBR', 'BR104'),
('Michelle Ramirez', '919095500676', '123 Oak Rd', 'MNGR', 'BR102'),
('Michael Thompson', '919129900676', '823 Main Jn', 'LIBR', 'BR100'),
('Jessica Taylor', '919099890676', '356 Elm Jn', 'MNGR', 'BR103'),
('Daniel Anderson', '919509900676', '564 Oak Jn', 'LIBR', 'BR101'),
('Laura Martinez', '919098200676', '438 Pine Jn', 'ASST', 'BR100'),
('Christopher Lee', '919097650676', '850 Maple Jn', 'MNGR', 'BR104'),
('Laura Doe', '919098200676', '438 Pine Jn', 'CLRK', 'BR101'),
('Martinez Davis', '919098200676', '438 Pine Jn', 'ASST', 'BR104'),
('Davis Emily', '919098200676', '438 Pine Jn', 'CLRK', 'BR100'),
('Jesi Smith', '919098200676', '438 Pine Jn', 'ASST', 'BR102'),
('John Brown', '919098200676', '438 Pine Jn', 'CLRK', 'BR104'),
('Mike Martinez', '919098200676', '438 Pine Jn', 'CLRK', 'BR103');

-- Author: @csesohag02
-- insert data into the Members table
INSERT INTO Members(Member_name, Member_address, Contact_no, Branch_id) VALUES
('Alice Johnson', '123 Main St', '919099925676', 'BR100'),
('Bob Smith', '456 Elm St', '915239925676', 'BR104'),
('Carol Davis', '789 Oak St', '919123925676', 'BR101'),
('Dave Wilson', '567 Pine St', '919899925676', 'BR104'),
('Eve Brown', '890 Maple St', '919895625676', 'BR100'),
('Frank Thomas', '234 Cedar St', '917899925676', 'BR102'),
('Grace Taylor', '345 Walnut St', '919090125676', 'BR103'),
('Henry Anderson', '456 Birch St', '917299925676', 'BR104'),
('Ivy Martinez', '567 Oak St', '919253925676', 'BR101'),
('Jack Wilson', '678 Pine St', '919099959676', 'BR103');

-- Author: @csesohag02
-- Insert data into the Book table
INSERT INTO Book (ISBN, Book_title, Author, Category, Book_language, Publication_year, Publisher, Price, Book_description) VALUES
('978-1-56619-909-4', 'The Great Adventure', 'John Smith', 'Fiction', 'English', 2015, 'Penguin Random House', 299.99, 'An exciting tale of exploration and discovery.'),
('978-1-891830-77-8', 'The Magical Forest', 'Emily Green', 'Children\'s Books', 'English', 2019, 'Scholastic', 149.99, 'A charming story for children about a magical forest.'),
('978-1-4028-9462-6', 'The Art of Success', 'Michael Adams', 'Non-Fiction', 'English', 2018, 'Simon & Schuster', 349.99, 'A guide to achieving success in life and business.'),
('978-3-16-148410-0', 'Mathematics for Beginners', 'Dr. Alan Cooper', 'Academic and Educational', 'English', 2021, 'Springer', 499.00, 'A basic guide to understanding mathematics.'),
('978-0-13-110362-7', 'Learn Python Programming', 'Mark Wilson', 'Technical and Professional', 'English', 2022, 'Pearson', 599.99, 'A detailed book on Python programming for beginners.'),
('978-0-06-440055-8', 'The Joy of Cooking', 'Julia Brown', 'Hobbies and Leisure', 'English', 2018, 'HarperCollins', 399.99, 'A timeless cookbook with classic recipes.'),
('978-0-345-53801-6', 'Superhero Chronicles', 'Stan Lee', 'Comics and Graphic Novels', 'English', 2015, 'Marvel Comics', 249.99, 'An action-packed graphic novel about superheroes.'),
('978-0-141-03613-0', 'The Collected Poems', 'Emily Dickinson', 'Poetry and Drama', 'English', 2020, 'Penguin Classics', 189.99, 'A collection of poems by Emily Dickinson.'),
('978-0-19-564491-9', 'Bhagavad Gita: As It Is', 'A.C. Bhaktivedanta Swami Prabhupada', 'Religious and Spiritual', 'Sanskrit/English', 2004, 'Bhaktivedanta Book Trust', 299.00, 'The sacred scripture of the Bhagavad Gita with commentary.'),
('978-0-8129-8032-6', 'Anthology of Short Stories', 'Various Authors', 'Miscellaneous', 'English', 2013, 'Random House', 149.99, 'A diverse collection of short stories from various genres.'),
('978-0-262-51087-2', 'Future of Technology', 'Jane Roberts', 'Non-Fiction', 'English', 2022, 'MIT Press', 474.75, 'An analysis of emerging technological trends.'),
('978-0-262-13472-9', 'Mystery of the Unknown', 'Alice Johnson', 'Fiction', 'English', 2020, 'HarperCollins', 299.49, 'A thrilling mystery novel with unexpected twists.'),
('978-0-596-52068-7', 'History of Civilization', 'Karen White', 'Non-Fiction', 'English', 2012, 'Oxford University Press', 429.99, 'A comprehensive overview of human civilization.'),
('978-0-307-47227-2', 'Adventures of Tom and Jerry', 'Robert Brown', 'Children\'s Books', 'English', 2015, 'Macmillan', 124.49, 'A delightful tale of friendship and adventure.'),
('978-1-4088-1234-5', 'Introduction to Physics', 'Dr. Linda Taylor', 'Academic and Educational', 'English', 2020, 'Cambridge University Press', 549.50, 'An introductory book on fundamental physics concepts.'),
('978-0-321-48681-3', 'Software Engineering Basics', 'Sarah Martin', 'Technical and Professional', 'English', 2019, 'Addison-Wesley', 649.75, 'A foundational book on software engineering concepts.'),
('978-1-78067-117-5', 'Photography for Beginners', 'Chris Adams', 'Hobbies and Leisure', 'English', 2016, 'Focal Press', 328.50, 'A beginner-friendly guide to photography techniques.'),
('978-1-61655-041-7', 'Manga Tales', 'Takahiro Mori', 'Comics and Graphic Novels', 'Japanese', 2021, 'Kodansha', 229.99, 'A captivating manga story full of adventure.'),
('978-0-7432-7356-5', 'Shakespeare\'s Plays', 'William Shakespeare', 'Poetry and Drama', 'English', 2017, 'Simon & Schuster', 439.00, 'A comprehensive collection of Shakespeare\'s plays.'),
('978-81-208-0063-1', 'Ramayana', 'Valmiki', 'Religious and Spiritual', 'Sanskrit/English', 1995, 'Motilal Banarsidass', 299.00, 'The ancient epic of Lord Rama.'),
('978-1-250-30726-4', 'Inspirational Quotes', 'Maya Jones', 'Miscellaneous', 'English', 2019, 'St. Martin\'s Press', 124.50, 'A book full of inspirational quotes for daily motivation.'),
('978-0-393-32001-7', 'The Science of Everything', 'Brian Cox', 'Academic and Educational', 'English', 2015, 'Norton', 438.95, 'A deep dive into various scientific concepts.'),
('978-0-575-07521-5', 'The World of Fantasy', 'George White', 'Fiction', 'English', 2014, 'Orbit', 329.50, 'An epic fantasy novel with rich world-building.'),
('978-1-5011-7326-0', 'Healthy Living', 'Lisa Carter', 'Hobbies and Leisure', 'English', 2021, 'Rodale', 249.99, 'A guide to maintaining a healthy lifestyle.'),
('978-0-553-57340-4', 'Star Wars Adventures', 'George Lucas', 'Comics and Graphic Novels', 'English', 2010, 'Del Rey', 349.99, 'An action-packed comic set in the Star Wars universe.'),
('978-0-671-64115-5', 'The Complete Works of Edgar Allan Poe', 'Edgar Allan Poe', 'Poetry and Drama', 'English', 1998, 'Simon & Schuster', 545.00, 'A collection of Edgar Allan Poe\'s literary works.'),
('978-0-7615-3649-6', 'The Mystery of the Lost Island', 'Nancy Drew', 'Fiction', 'English', 2017, 'Grosset & Dunlap', 199.99, 'A gripping mystery on an uncharted island.'),
('978-1-56723-641-8', 'Yoga and Wellness', 'Dr. Ramesh Patel', 'Religious and Spiritual', 'English', 2016, 'Jaico Publishing House', 322.49, 'A holistic guide to yoga practices and their benefits.'),
('978-0-88192-570-1', 'Gardening for Beginners', 'Rachel Thomas', 'Hobbies and Leisure', 'English', 2020, 'Timber Press', 199.99, 'A practical introduction to gardening techniques.');

-- Author: @csesohag02
-- Insert data into the Book_copies table
INSERT INTO Book_copies(Book_id, Branch_id, No_of_copies) VALUES
('BK100', 'BR100', 10),
('BK101', 'BR101', 5),
('BK102', 'BR102', 7),
('BK103', 'BR103', 12),
('BK104', 'BR104', 8),
('BK105', 'BR100', 4),
('BK106', 'BR101', 15),
('BK107', 'BR102', 6),
('BK108', 'BR103', 9),
('BK109', 'BR104', 10),
('BK110', 'BR100', 20),
('BK111', 'BR101', 11),
('BK112', 'BR102', 13),
('BK113', 'BR103', 7),
('BK114', 'BR104', 6),
('BK115', 'BR100', 5),
('BK116', 'BR101', 10),
('BK117', 'BR102', 8),
('BK118', 'BR103', 3),
('BK119', 'BR104', 14),
('BK120', 'BR100', 16),
('BK121', 'BR101', 12),
('BK122', 'BR102', 6),
('BK123', 'BR103', 9),
('BK124', 'BR104', 7),
('BK125', 'BR100', 8),
('BK126', 'BR101', 11),
('BK127', 'BR102', 5),
('BK128', 'BR103', 10),
('BK100', 'BR104', 7);

-- Created and maintained by @csesohag02
-- GitHub: https://github.com/csesohag02
