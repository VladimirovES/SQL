--ТАБЛИЦЫ
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee re;


-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary  from employee_salary ES
join employees E on E.id = ES.employee_id
join salary S on S.id = ES.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employee_salary es
join employees E on E.id = es.employee_id
join salary S on S.id=es.salary_id
where monthly_salary <2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- ТАКИХ ПОЗИЦИЙ НЕТ!
select monthly_salary  from employee_salary es 
right join salary S on S.id = es.salary_id
where employee_id is NUll
 

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary  from employee_salary es 
right join salary S on S.id = es.salary_id
where employee_id is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select employee_name from employee_salary es
right join employees e on e.id = es.employee_id 
where salary_id is null

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from roles_employee re
join employees e on e.id = re.employee_id 
join roles r on r.id =re.role_id ;

--  7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name  from roles_employee re
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Java %';

--8. Вывести имена и должность только Python разработчиков.

select employee_name , role_name  from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%QA engineer%'

--10. Вывести имена и должность ручных QA инженеров.

select employee_name , role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Manual QA engineer%'

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Automation QA engineer'
order by role_name

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles r on r.id = re.role_id 
join employee_salary es on es.employee_id = re.employee_id 
join salary s on s.id = es.salary_id
where role_name  like '%Junior%'

---- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name  from roles_employee re 
join employee_salary es on es.employee_id = re.employee_id 
join employees e on e.id = re.employee_id 
join roles r on r.id =re.role_id 
join salary s on s.id = es.salary_id 
where role_name like '%Middle%'



