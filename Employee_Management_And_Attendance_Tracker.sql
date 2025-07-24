-- Create and use database
CREATE DATABASE  Employee_Management_And_Attendance_Tracker;
USE Employee_Management_And_Attendance_Tracker;

-- Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Roles Table
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_title VARCHAR(50) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    role_id INT,
    join_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Attendance Table
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Insert Departments
INSERT INTO Departments (department_name) VALUES 
('HR'), ('IT'), ('Finance'), ('Sales');

-- Insert Roles
INSERT INTO Roles (role_title) VALUES 
('Manager'), ('Developer'), ('Tester'), ('Intern');

-- Insert Employees
INSERT INTO Employees (name, email, department_id, role_id, join_date) VALUES
('Alice Smith', 'alice.smith@company.com', 1, 1, '2023-01-15'),
('Bob Johnson', 'bob.j@company.com', 2, 2, '2022-12-01'),
('Clara Davis', 'clara.d@company.com', 3, 3, '2024-03-10'),
('David Wilson', 'david.w@company.com', 1, 2, '2023-05-01'),
('Evelyn Moore', 'evelyn.m@company.com', 2, 1, '2022-11-05'),
('Frank Clark', 'frank.c@company.com', 4, 4, '2023-06-20'),
('Grace Hall', 'grace.h@company.com', 3, 2, '2023-07-01'),
('Henry Allen', 'henry.a@company.com', 2, 3, '2023-09-15'),
('Ivy Young', 'ivy.y@company.com', 4, 4, '2023-10-10'),
('Jack Harris', 'jack.h@company.com', 3, 3, '2023-08-22'),
('Karen Lewis', 'karen.l@company.com', 1, 2, '2023-04-18'),
('Leo Scott', 'leo.s@company.com', 2, 1, '2023-01-05'),
('Mia Walker', 'mia.w@company.com', 3, 2, '2022-10-30'),
('Noah Turner', 'noah.t@company.com', 4, 4, '2023-07-12'),
('Olivia King', 'olivia.k@company.com', 1, 1, '2022-09-18'),
('Paul Wright', 'paul.w@company.com', 2, 3, '2023-02-14'),
('Quinn Lopez', 'quinn.l@company.com', 3, 2, '2023-03-03'),
('Ruby Hill', 'ruby.h@company.com', 4, 1, '2023-05-22'),
('Steve Adams', 'steve.a@company.com', 1, 4, '2023-06-15'),
('Tina Baker', 'tina.b@company.com', 2, 2, '2023-07-25'),
('Uma Reed', 'uma.r@company.com', 3, 3, '2023-08-19'),
('Victor Cox', 'victor.c@company.com', 4, 1, '2023-09-11'),
('Wendy Rivera', 'wendy.r@company.com', 1, 2, '2023-10-02'),
('Xander Price', 'xander.p@company.com', 2, 3, '2023-11-01'),
('Yara Bell', 'yara.b@company.com', 3, 1, '2023-12-12');

-- Insert Attendance
INSERT INTO Attendance (employee_id, date, check_in, check_out, status) VALUES
(1, '2025-07-01', '09:00:00', '17:00:00', 'On Time'),
(2, '2025-07-01', '09:20:00', '17:05:00', 'Late'),
(3, '2025-07-01', '08:55:00', '17:00:00', 'On Time'),
(4, '2025-07-01', '09:30:00', '17:15:00', 'Late'),
(5, '2025-07-01', '09:10:00', '17:20:00', 'On Time'),
(6, '2025-07-02', '09:25:00', '17:00:00', 'Late'),
(7, '2025-07-02', '08:50:00', '17:10:00', 'On Time'),
(8, '2025-07-02', '09:05:00', '17:30:00', 'On Time'),
(9, '2025-07-02', '09:18:00', '17:00:00', 'Late'),
(10, '2025-07-02', '09:00:00', '17:00:00', 'On Time'),
(1, '2025-07-02', '09:02:00', '17:00:00', 'On Time'),
(2, '2025-07-02', '09:22:00', '17:10:00', 'Late'),
(3, '2025-07-02', '09:11:00', '17:05:00', 'On Time'),
(4, '2025-07-02', '09:40:00', '17:20:00', 'Late'),
(5, '2025-07-02', '09:00:00', '17:30:00', 'On Time'),
(6, '2025-07-03', '08:55:00', '17:15:00', 'On Time'),
(7, '2025-07-03', '09:17:00', '17:00:00', 'Late'),
(8, '2025-07-03', '09:05:00', '17:25:00', 'On Time'),
(9, '2025-07-03', '09:23:00', '17:00:00', 'Late'),
(10, '2025-07-03', '09:00:00', '17:10:00', 'On Time'),
(11, '2025-07-03', '09:01:00', '17:05:00', 'On Time'),
(12, '2025-07-03', '09:16:00', '17:00:00', 'Late'),
(13, '2025-07-03', '09:04:00', '17:10:00', 'On Time'),
(14, '2025-07-03', '09:35:00', '17:00:00', 'Late'),
(15, '2025-07-03', '09:08:00', '17:20:00', 'On Time');

-- 3. ALTER TABLE: Add a phone column to Employees
ALTER TABLE Employees ADD phone VARCHAR(15);

-- 4. UPDATE: Update an employee's email
UPDATE Employees SET email = 'alice.smith@newmail.com' WHERE name = 'Alice Smith';

-- 5. DELETE: Delete Interns (role_id = 4)
DELETE FROM Employees WHERE role_id = 4;

-- 6. DROP (DDL and DML)
-- Drop a column
ALTER TABLE Employees DROP COLUMN phone;
-- Drop a table (DDL)
DROP TABLE IF EXISTS OldTable;
-- Remove data from a table (DML)
DELETE FROM Attendance;

-- 7. SELECT + Wildcards, DISTINCT, ORDER BY
SELECT * FROM Employees WHERE email LIKE '%@company.com';
SELECT DISTINCT department_id FROM Employees;
SELECT name, join_date FROM Employees ORDER BY join_date DESC;

-- 8. Alias, Logical Ops, Set, Range, WHERE, HAVING
SELECT name AS employee_name, email FROM Employees WHERE department_id = 2;
SELECT * FROM Employees WHERE department_id IN (1, 2);
SELECT * FROM Employees WHERE join_date BETWEEN '2023-01-01' AND '2024-01-01';
SELECT department_id, COUNT(*) AS emp_count FROM Employees GROUP BY department_id HAVING emp_count > 3;

-- 9. Aggregate Functions
SELECT department_id, COUNT(*) AS total_employees, MAX(join_date) AS latest_joining FROM Employees GROUP BY department_id;

-- 10. JOINS
SELECT e.name, d.department_name, r.role_title
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Roles r ON e.role_id = r.role_id;

-- 11. SUBQUERIES

-- Scalar Subquery
SELECT name, (SELECT COUNT(*) FROM Attendance a WHERE a.employee_id = e.employee_id) AS attendance_days FROM Employees e;

-- Correlated Subquery with EXISTS
SELECT name FROM Employees e WHERE EXISTS (
    SELECT 1 FROM Attendance a WHERE a.employee_id = e.employee_id AND a.status = 'Late'
);

-- Subquery using IN
SELECT name FROM Employees WHERE employee_id IN (
    SELECT employee_id FROM Attendance WHERE status = 'Late'
);

-- Subquery using =
SELECT name FROM Employees WHERE department_id = (
    SELECT department_id FROM Departments WHERE department_name = 'IT'
);

-- 12. VIEWS
CREATE VIEW LateArrivals AS
SELECT e.name, a.date, a.check_in FROM Employees e
JOIN Attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Late';

-- Use the view
SELECT * FROM LateArrivals;

-- 13. STORED FUNCTION: Total work hours per employee
DELIMITER //
CREATE FUNCTION total_hours(emp_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(TIME_TO_SEC(TIMEDIFF(check_out, check_in)))/3600 INTO total
    FROM Attendance WHERE employee_id = emp_id;
    RETURN total;
END;
//
DELIMITER ;

-- 14. STORED PROCEDURE: Mark attendance
DELIMITER //
CREATE PROCEDURE mark_attendance (
    IN emp_id INT,
    IN in_time TIME,
    IN out_time TIME
)
BEGIN
    DECLARE status VARCHAR(10);
    IF in_time > '09:15:00' THEN
        SET status = 'Late';
    ELSE
        SET status = 'On Time';
    END IF;
    
    INSERT INTO Attendance (employee_id, date, check_in, check_out, status)
    VALUES (emp_id, CURDATE(), in_time, out_time, status);
END;
//
DELIMITER ;

 -- 3. Queries for Monthly Attendance & Late Arrivals
-- a. Monthly Attendance Report Per Employee

SELECT 
    e.name,
    DATE_FORMAT(a.date, '%Y-%m') AS month,
    COUNT(*) AS total_present_days
FROM 
    Employees e
JOIN 
    Attendance a ON e.employee_id = a.employee_id
GROUP BY 
    e.name, month
ORDER BY 
    month;
    
    -- b. Late Arrivals Report

SELECT 
    e.name,
    a.date,
    a.check_in
FROM 
    Employees e
JOIN 
    Attendance a ON e.employee_id = a.employee_id
WHERE 
    a.status = 'Late'
ORDER BY 
    a.date;
✅ 4. Add Trigger for Status (Late/On Time)
🔹 Trigger to Auto-Set Attendance Status on Insert
sql
Copy
Edit
DELIMITER $$

CREATE TRIGGER set_attendance_status
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN
    IF NEW.check_in > '09:15:00' THEN
        SET NEW.status = 'Late';
    ELSE
        SET NEW.status = 'On Time';
    END IF;
END$$

DELIMITER ;
-- 5. Function to Calculate Total Work Hours
-- Total Work Hours for an Employee (All Time)

DELIMITER $$

CREATE FUNCTION get_total_work_hours(emp_id INT)
RETURNS TIME
DETERMINISTIC
BEGIN
    DECLARE total TIME;
    SELECT SEC_TO_TIME(SUM(TIMESTAMPDIFF(SECOND, check_in, check_out)))
    INTO total
    FROM Attendance
    WHERE employee_id = emp_id;

    RETURN total;
END$$

DELIMITER ;

-- SELECT get_total_work_hours(1);
-- 6. Reports using GROUP BY and HAVING
-- a. Employees with More Than 3 Days Present

SELECT 
    e.name,
    COUNT(*) AS present_days
FROM 
    Employees e
JOIN 
    Attendance a ON e.employee_id = a.employee_id
GROUP BY 
    e.name
HAVING 
    present_days > 3;
    
-- b. Department-wise Average Work Hours

SELECT 
    d.department_name,
    SEC_TO_TIME(AVG(TIMESTAMPDIFF(SECOND, a.check_in, a.check_out))) AS avg_work_hours
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id
JOIN 
    Attendance a ON e.employee_id = a.employee_id
GROUP BY 
    d.department_name;
    
    -- ALTER Table

-- Add a column to Employees table
ALTER TABLE Employees ADD COLUMN phone VARCHAR(15);

-- Rename column
ALTER TABLE Departments RENAME COLUMN department_name TO dept_name;

-- Add a new constraint to ensure unique emails in Employees table
ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (email);
-- 4. UPDATE Records

-- Update a specific employee's email

UPDATE Employees 
SET email = 'alice.smith@newcompany.com' 
WHERE employee_id = 1;

-- Update all employees who are in the 'Sales' department
UPDATE Employees 
SET role_id = 2
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Sales');
-- 5. DELETE Records

-- Delete an employee
DELETE FROM Employees WHERE employee_id = 5;

-- Delete all records from Attendance for a specific employee
DELETE FROM Attendance WHERE employee_id = 5;

-- Delete table (for cleanup)
DROP TABLE IF EXISTS Attendance;
-- 6. DROP Table

-- Drop table completely
DROP TABLE IF EXISTS Employees;

-- Drop a column from a table
ALTER TABLE Employees DROP COLUMN phone;
-- 7. SELECT Queries
-- Using Wildcards, DISTINCT, ORDER BY

-- Wildcard Search for emails containing 'company'
SELECT * FROM Employees WHERE email LIKE '%company%';

-- DISTINCT to show unique departments
SELECT DISTINCT department_id FROM Employees;

-- ORDER BY to sort employees by join_date
SELECT name, join_date FROM Employees ORDER BY join_date DESC;
-- 8. Alias, Logical Operators, Set, Range, WHERE, HAVING

-- Alias for columns
SELECT name AS employee_name, department_id AS dept_id FROM Employees;

-- Using Logical Operators (AND, OR)
SELECT name, role_id FROM Employees WHERE department_id = 2 AND role_id = 3;

-- Using SET operation
SELECT * FROM Employees WHERE department_id = 1
UNION
SELECT * FROM Employees WHERE department_id = 2;

-- Using Range (BETWEEN)
SELECT name FROM Employees WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31';

-- WHERE clause
SELECT * FROM Employees WHERE department_id = 2;

-- HAVING (to filter groups)
SELECT department_id, COUNT(*) AS total_employees
FROM Employees
GROUP BY department_id
HAVING COUNT(*) > 3;
-- 9. Aggregate Functions

-- COUNT, AVG, SUM
SELECT department_id, COUNT(*) AS total_employees, AVG(EXTRACT(YEAR FROM JOIN_DATE)) AS avg_experience 
FROM Employees 
GROUP BY department_id;

-- MAX and MIN
SELECT MAX(join_date) AS latest_join_date, MIN(join_date) AS earliest_join_date FROM Employees;
-- 10. JOINS

-- INNER JOIN
SELECT e.name, r.role_title
FROM Employees e
JOIN Roles r ON e.role_id = r.role_id;

-- LEFT JOIN
SELECT e.name, a.date, a.check_in
FROM Employees e
LEFT JOIN Attendance a ON e.employee_id = a.employee_id;
-- 11. Subqueries
-- Scalar Subquery

SELECT name, 
       (SELECT COUNT(*) FROM Attendance a WHERE a.employee_id = e.employee_id) AS total_days
FROM Employees e;
-- Correlated Subquery

SELECT name 
FROM Employees e
WHERE EXISTS (
    SELECT 1 
    FROM Attendance a
    WHERE a.employee_id = e.employee_id 
    AND a.status = 'Late'
);
-- Subquery with IN

SELECT name
FROM Employees
WHERE employee_id IN (
    SELECT employee_id 
    FROM Attendance
    WHERE status = 'Late'
);
-- Using = in Subquery

SELECT name
FROM Employees
WHERE department_id = (
    SELECT department_id 
    FROM Departments 
    WHERE department_name = 'Sales'
);
-- 12. Creating and Using Views

-- Creating View for Attendance Summary
CREATE VIEW AttendanceSummary AS
SELECT e.name, a.date, a.check_in, a.check_out, a.status
FROM Employees e
JOIN Attendance a ON e.employee_id = a.employee_id;

-- Query the view
SELECT * FROM AttendanceSummary;
13. Stored Function

-- Create a function to calculate total work hours for an employee
DELIMITER $$

CREATE FUNCTION total_work_hours(emp_id INT) 
RETURNS TIME 
BEGIN
    DECLARE total TIME;
    SELECT SEC_TO_TIME(SUM(TIMESTAMPDIFF(SECOND, check_in, check_out))) 
    INTO total
    FROM Attendance 
    WHERE employee_id = emp_id;
    RETURN total;
END$$

DELIMITER ;
14. Stored Procedure

-- Create a procedure to mark attendance with timestamp
DELIMITER $$

CREATE PROCEDURE mark_attendance(IN emp_id INT, IN check_in_time TIME, IN check_out_time TIME)
BEGIN
    INSERT INTO Attendance (employee_id, date, check_in, check_out, status) 
    VALUES (emp_id, CURRENT_DATE, check_in_time, check_out_time, 
    CASE 
        WHEN check_in_time > '09:15' THEN 'Late' 
        ELSE 'On Time' 
    END);
END$$

DELIMITER ;

-- Call the procedure
CALL mark_attendance(1, '09:30:00', '17:00:00');


