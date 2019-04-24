-- Find all employees
SELECT * from employee;

-- Find all clients
SELECT * from client;

-- Find all employees orderd by salary
SELECT * FROM employee ORDER BY salary DESC;

-- Find all employees orderd by sex then name
SELECT * FROM employee ORDER BY sex, first_name, last_name;

-- Find the first five employees in the table
SELECT * FROM employee LIMIT 5;

-- Find the first and last names of all employees
SELECT first_name, last_name from employee;

-- Find the forename and surname names of all employees
SELECT first_name AS forename, last_name AS surname FROM Employee;

-- Find out all the different genders
SELECT DISTINCT sex from Employee;

-- ------------ SQL FUNCTIONS ----------------------------------------------------

-- Find the number of employees
SELECT COUNT(emp_id) FROM employee;

-- Find how many employees have supervisors
SELECT COUNT(super_id) FROM employee;

-- Find the number of female employees born after 1970
SELECT COUNT(emp_id) FROM employee WHERE sex = 'F' AND birth_day > '1971-01-01';

-- Find the average of all employee's salaries
SELECT avg(salary) from employee;

-- Find the average of all male employee's salaries 
SELECT avg(salary) from employee WHERE sex = 'M';

-- Find the sum of all employee's salaries
SELECT SUM(salary) FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex FROM employee GROUP BY sex;

-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id;

-- Find the total each client spent
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id;

-- WILD CARDS -------------------------------------------------------------

-- Find any clients who are an LLC
SELECT * FROM client WHERE client_name LIKE '%LLC';

-- Find any branch suppliers who are in the label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Label%';

-- Find any employee born in october
SELECT * FROM employee WHERE birth_day LIKE '____-10%';

-- Find any employee born in february
SELECT * FROM employee WHERE birth_day LIKE '____-02%';

-- Find any clients that are schools
SELECT * FROM client WHERE client_name LIKE '%school%';

-- UNION -------------------------------------------------------------

-- Find a list of employee and branch names
SELECT first_name AS Company_Names FROM employee
UNION
SELECT branch_name FROM branch;

-- Find a list of all clients and branch suppliers names
SELECT client_name FROM client
UNION
SELECT supplier_name FROM branch_supplier;

-- Find a list of all money spent or earned by the company
SELECT salary FROM employee
UNION
SELECT total_sales FROM works_with;

-- JOINS -------------------------------------------------------------

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- NESTED QUERIES -------------------------------------------------------------
-- Find names of all employees who have sold over 30,000 to a single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
	SELECT works_with.emp_id 
	FROM works_with
	WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch
-- that Michael Scott manages
-- Assume you know Michale's ID
SELECT client.client_name
FROM client
WHERE client.branch_id = (
	SELECT branch.branch_id 
	FROM branch
	WHERE branch.mgr_id = 102
    LIMIT 1
);









































