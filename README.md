# Library Management System using MySQL

## Overview
This repository contains SQL scripts and stored procedures to manage the operations of a library management system. It defines the schema, procedures, and sample usage for managing branches, employee positions, employees, members, books, book copies, book issues, and fines. The system also supports archiving data for audit and historical purposes.

## Features
- **Branch Management**
  - Open a new branch.
  - Close an existing branch and archive related data.
- **Employee Management**
  - Create and manage employee positions and salary.
  - Add a new employee.
  - Remove an employee and archive their data.
- **Member Management**
  - Register a new library member.
  - Remove a member and archive their data.
- **Book Management**
  - Add books to the library.
  - Manage book copies across branches.
  - Archive book copies when removed.
- **Book Issue and Return**
  - Issue books to members.
  - Return books and calculate fines for late returns.
- **Fine Management**
  - Pay outstanding fines.

## File Structure
- **Schema Definition**
  - SQL scripts to create tables for branches, employee positions, employees, members, books, book copies, issues, fines, and archives.
- **Stored Procedures**
  - Procedures for all operations mentioned above, ensuring data consistency and integrity.
- **Sample Operations**
  - Example procedure calls for testing and demonstration purposes.

## How to Use
1. Clone the repository to your local machine.
2. Import the scripts into your preferred SQL database management system (e.g., MySQL).
3. Execute the schema creation script to set up the database.
4. Use the stored procedures for library operations by passing the required parameters.

## Example Usage
### Open a Branch
```sql
CALL OpenBranch('Joo St Rd', '919549988680');
```

### Close a Branch
```sql
CALL CloseBranch('BR100', 'Due to low members, the branch is closed permanently');
```

### Add an Employee
```sql
CALL AddEmployee('John Don', '917891597532', '123 Oak Rd', 'MNGR', 'BR105');
```

### Remove a Member
```sql
CALL RemoveMember('MBR106', 'Left the library');
```

### Add a Book
```sql
CALL AddBook('987-6-54321-098-7', 'Advanced SQL', 'Jane Smith', 'Programming', 'English', 2022, 'Code Publisher', 499.99, NULL);
```

### Issue a Book
```sql
CALL IssueBook('MBR100', 'CPY100');
```

## Author
- **Created and maintained by @csesohag02** 
  GitHub: [@csesohag02](https://github.com/csesohag02)
  
