/* Written by Anthony Hamlin
   CIS332 - In Class Dec 5th
*/

--Example 1

SELECT INITCAP(fname || ' ' || lname) AS "Employee Name", 
        TO_CHAR(add_months(hiredate, 20 * 12), 'fmMonth dd, yyyy') AS "Retirement Date"
FROM employees;

--Example 2

SELECT d.dname AS "Department", count(e.empno) AS "Number of Employees"
FROM employees e RIGHT JOIN department d ON e.DEPTNO = d.DEPTNO
GROUP BY d.dname
HAVING count(e.empno) < 3;

--Example 3

-- Can't be done, data daesn't match. There is no Jonathon Taylor.

-- Example 4

-- Can't be done, data daesn't match. There is no William Gietz.

-- Example 5

SELECT INITCAP(fname || ' ' || lname) AS "Employee Name", TO_CHAR(MTHSAL, '$9999.99') AS "Monthly Salary", TO_CHAR((SELECT AVG(mthsal) FROM employees), '$9999.99') AS "Dept Avg Monthy Salary" 
FROM employees
WHERE mthsal < (SELECT AVG(mthsal) FROM employees)
ORDER BY DEPTNO, EMPNO;

-- Example 6

SELECT INITCAP(e.fname || ' ' || e.lname) AS "Employee Name", NVL2(e.mgr, INITCAP(m.fname || ' ' || m.lname), '***N/A***') AS "Manager"
FROM employees e LEFT JOIN employees m ON e.mgr = m.empno
ORDER BY e.empno;

