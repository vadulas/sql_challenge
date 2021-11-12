--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT EMP.EMP_NO, FIRST_NAME, LAST_NAME, SEX, SALARY FROM 
	EMPLOYEES AS EMP
	LEFT JOIN SALARIES AS SAL ON EMP.EMP_NO = SAL.EMP_NO;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '1986-1-1' AND '1986-12-31' ORDER BY HIRE_DATE;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DEPT.DEPT_NO, DEPT.DEPT_NAME, MGR.EMP_NO, EMP.FIRST_NAME, EMP.LAST_NAME FROM 
	DEPARTMENTS AS DEPT
	JOIN DEPARTMENT_MANAGER AS MGR ON DEPT.DEPT_NO = MGR.DEPT_NO
	JOIN EMPLOYEES AS EMP ON MGR.EMP_NO = EMP.EMP_NO;
	
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT EMP.EMP_NO, EMP.FIRST_NAME, EMP.LAST_NAME, DEPT.DEPT_NAME FROM 
	EMPLOYEES AS EMP 
	JOIN DEPARTMENT_EMPLOYEE AS DEPT_EMP ON EMP.EMP_NO = DEPT_EMP.EMP_NO
	JOIN DEPARTMENTS AS DEPT ON DEPT_EMP.DEPT_NO = DEPT.DEPT_NO

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX FROM 
	EMPLOYEES 
	WHERE FIRST_NAME  = 'Hercules' 
	AND LAST_NAME LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT EMP.EMP_NO, FIRST_NAME, LAST_NAME, DEPT_NAME
	FROM EMPLOYEES AS EMP
	JOIN DEPARTMENT_EMPLOYEE AS DEPT_EMP ON EMP.EMP_NO = DEPT_EMP.EMP_NO
	JOIN DEPARTMENTS AS DEPT ON DEPT.DEPT_NO = DEPT_EMP.DEPT_NO
	WHERE DEPT_NAME = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT EMP.EMP_NO, FIRST_NAME, LAST_NAME, DEPT_NAME
	FROM EMPLOYEES AS EMP
	JOIN DEPARTMENT_EMPLOYEE AS DEPT_EMP ON EMP.EMP_NO = DEPT_EMP.EMP_NO
	JOIN DEPARTMENTS AS DEPT ON DEPT.DEPT_NO = DEPT_EMP.DEPT_NO
	WHERE DEPT_NAME IN ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(*) AS LAST_NAME_COUNT, LAST_NAME FROM EMPLOYEES 
	GROUP BY LAST_NAME 
	ORDER BY LAST_NAME_COUNT DESC;
	
	
	
