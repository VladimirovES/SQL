--�������
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee re;


-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary  from employee_salary ES
join employees E on E.id = ES.employee_id
join salary S on S.id = ES.salary_id;

--2. ������� ���� ���������� � ������� �� ������ 2000.

select employee_name, monthly_salary from employee_salary es
join employees E on E.id = es.employee_id
join salary S on S.id=es.salary_id
where monthly_salary <2000;

--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
-- ����� ������� ���!
select monthly_salary  from employee_salary es 
right join salary S on S.id = es.salary_id
where employee_id is NUll
 

--4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select monthly_salary  from employee_salary es 
right join salary S on S.id = es.salary_id
where employee_id is null and monthly_salary < 2000;

--5. ����� ���� ���������� ���� �� ��������� ��.

select employee_name from employee_salary es
right join employees e on e.id = es.employee_id 
where salary_id is null

-- 6. ������� ���� ���������� � ���������� �� ���������.

select employee_name, role_name from roles_employee re
join employees e on e.id = re.employee_id 
join roles r on r.id =re.role_id ;

--  7. ������� ����� � ��������� ������ Java �������������.

select employee_name, role_name  from roles_employee re
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Java %';

--8. ������� ����� � ��������� ������ Python �������������.

select employee_name , role_name  from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������.

select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%QA engineer%'

--10. ������� ����� � ��������� ������ QA ���������.

select employee_name , role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Manual QA engineer%'

-- 11. ������� ����� � ��������� ��������������� QA

select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Automation QA engineer'
order by role_name

-- 12. ������� ����� � �������� Junior ������������

select employee_name, role_name, monthly_salary  from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
join employee_salary es on es.employee_id = re.employee_id 
join salary s on s.id = es.salary_id
where role_name  like '%Junior%'

---- 13. ������� ����� � �������� Middle ������������

select employee_name, role_name, monthly_salary   from roles_employee re 
join employee_salary es on es.employee_id = re.employee_id 
join employees e on e.id = re.employee_id 
join roles r on r.id =re.role_id 
join salary s on s.id = es.salary_id 
where role_name like '%Middle%'

--- 14. ������� ����� � �������� Senior ������������

select employee_name, role_name, monthly_salary  from employee_salary es
join employees e on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id =es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Senior%'

--15. ������� �������� Java �������������

select role_name, monthly_salary  from roles_employee re 
join roles r on r.id = re.role_id 
join employee_salary es on es.employee_id = re.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Java %'

--16. ������� �������� Python �������������

select role_name, monthly_salary from roles_employee re 
join roles r on r.id = re.role_id 
join employee_salary es on es.employee_id = re.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Python%'

-- 17. ������� ����� � �������� Junior Python �������������

select employee_name, role_name, monthly_salary from employee_salary es 
join employees e on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Junior Python%'

-- 18. ������� ����� � �������� Middle JS �������������

select employee_name, role_name, monthly_salary from employee_salary es 
join employees e on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Middle JavaScript%'

-- 19. ������� ����� � �������� Senior Java �������������
------------------- � ���� ����� ���--------------------
select employee_name, role_name, monthly_salary from employee_salary es 
join employees e on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Senior JavaScript%'

--20. ������� �������� Junior QA ���������

select role_name, monthly_salary  from employee_salary es 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id =es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Junior% %_% %QA%'

--21. ������� ������� �������� ���� Junior ������������

select AVG(monthly_salary)  from employee_salary es 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Junior%'

--22. ������� ����� ������� JS �������������

select SUM(monthly_salary) from employee_salary es 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id
where role_name like '%_% %JavaScript%'

-- 23. ������� ����������� �� QA ���������

select MIN(monthly_salary) from employee_salary es 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%QA% %engineer'

-- 24. ������� ������������ �� QA ���������

select MAX(monthly_salary) from employee_salary es 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id
join roles r on r.id = re.role_id 
where role_name like '%QA% %engineer'

--25. ������� ���������� QA ���������

select Count(role_name) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like '%QA% %eng%'

--26. ������� ���������� Middle ������������

select count(role_name) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like '%Middle%'

--27. ������� ���������� �������������

select count(role_name) from roles_employee re 
join roles r on r.id = re.role_id 
where role_name like '%dev%'

--28. ������� ���� (�����) �������� �������������.

select sum(monthly_salary) from roles_employee re 
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id = re.employee_id
join salary s on s.id = es.salary_id 
where role_name like '%dev%'

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������

select employee_name, role_name, monthly_salary  from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
join employee_salary es on es.employee_id = re.employee_id 
join salary s on s.id = es.salary_id 
order by monthly_salary 

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select employee_name, role_name, monthly_salary from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id =re.role_id 
join employee_salary es on es.employee_id =re.employee_id 
join salary s on s.id = es.salary_id 
where monthly_salary between 1700 and 2300
order by monthly_salary 

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select employee_name, role_name, monthly_salary from roles_employee re 
join employee_salary es on es.employee_id = re.employee_id 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
join salary s on s.id = es.salary_id 
where monthly_salary < 2300
order by monthly_salary 

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select employee_name , role_name, monthly_salary from employee_salary es
join employees e on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
join roles_employee re on re.employee_id = es.employee_id 
join roles r on r.id = re.role_id 
where monthly_salary in(1100,1500,2000)

