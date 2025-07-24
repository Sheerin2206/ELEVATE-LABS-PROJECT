Employee Management and Attendance Tracker — SQL Project

This SQL-based project provides a comprehensive solution for managing employee information and tracking attendance in a corporate environment. 
Built in "MySQL Workbench" the database includes employee roles, departments, attendance logs, reporting functions, triggers, procedures, and views.

Features

 Employee, Role, Department & Attendance Management
 Attendance logging with auto-status detection via Trigger
 Monthly and late arrival reports
 Aggregate work hour calculations via functions
 Stored Procedures for attendance marking
 Queries covering DDL, DML, JOINS, Subqueries, Views, etc.

Database Used

Database Name:"Employee_Management_And_Attendance_Tracker"

Tables Created

1. `Departments` – Stores department info
2. `Roles` – Stores job roles
3. `Employees` – Stores employee details (linked to department & role)
4. `Attendance` – Logs daily attendance with timestamps and status

* 4 Departments, 4 Roles
* 25 Employees (sample data)
* Multiple Attendance entries (daily records for each employee)

 SQL Concepts 

 DDL & DML

* `CREATE`, `ALTER`, `DROP`, `INSERT`, `UPDATE`, `DELETE`

 Queries

* `SELECT`, `ORDER BY`, `DISTINCT`, `WHERE`, `HAVING`
* `BETWEEN`, `IN`, `LIKE`, `ALIAS`, `UNION`

 Joins

* `INNER JOIN`, `LEFT JOIN`

 Subqueries

* Scalar, Correlated, `IN`, `EXISTS`, `=`

 Views

* Created `LateArrivals` and `AttendanceSummary`

 Aggregate Functions

* `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`

 Stored Procedure

`mark_attendance()`

* Automatically assigns attendance status based on `check_in` time.
* Parameters: `emp_id`, `check_in_time`, `check_out_time`

 Usage:


CALL mark_attendance(1, '09:30:00', '17:00:00');

 Stored Functions

 1. `total_hours(emp_id)`

* Returns total hours worked in hours (INT).

 2. `get_total_work_hours(emp_id)`

* Returns total work duration in `HH:MM:SS` format.

 Trigger

`set_attendance_status`

* Automatically sets the `status` field as `Late` or `On Time` before inserting into `Attendance`.


 Reports

 1. **Monthly Attendance Per Employee**


SELECT e.name, DATE_FORMAT(a.date, '%Y-%m') AS month, COUNT(*) AS total_present_days
FROM Employees e
JOIN Attendance a ON e.employee_id = a.employee_id
GROUP BY e.name, month;


 2. **Late Arrival Logs**

sql
SELECT e.name, a.date, a.check_in
FROM Employees e
JOIN Attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Late';


3. **Department-wise Average Work Hours**


SELECT d.department_name, 
SEC_TO_TIME(AVG(TIMESTAMPDIFF(SECOND, a.check_in, a.check_out))) AS avg_work_hours
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Attendance a ON e.employee_id = a.employee_id
GROUP BY d.department_name;

 Deliverables

* ✔️ `employee_tracker.sql` (complete SQL script with DDL, DML, procedures, views, triggers, etc.)
* ✔️ `README.md` (this documentation)

