/* Written by Anthony Hamlin
   CIS332 - In Class Dec 5th
*/

--Example 1

SELECT fname, lname, hiredate, add_months(hiredate, 20 * 12)
FROM employees;

SELECT INITCAP(fname || ' ' || lname) AS "Employee Name", 
        TO_CHAR(add_months(hiredate, 20 * 12), 'fmMonth dd, yyyy') AS "Retirement Date"
FROM employees;

--Example 2

SELECT e.fname, e.lname, e.deptno, d.dname
FROM employees e JOIN department d ON e.DEPTNO = d.DEPTNO;

SELECT d.dname, count(*)
FROM employees e JOIN department d ON e.DEPTNO = d.DEPTNO
GROUP BY d.dname;

SELECT d.dname, count(e.empno)
FROM employees e RIGHT JOIN department d ON e.DEPTNO = d.DEPTNO
GROUP BY d.dname;

SELECT d.dname AS "Department", count(e.empno) AS "Number of Employees"
FROM employees e RIGHT JOIN department d ON e.DEPTNO = d.DEPTNO
GROUP BY d.dname
HAVING count(e.empno) < 3;

