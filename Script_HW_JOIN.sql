-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select * from employees;
select * from salary;
select * from employee_salary;

select employee_name, monthly_salary  from employee_salary ES
join employees E on E.id = ES.employee_id
join salary S on S.id = ES.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employee_salary es
join employees E on E.id = es.employee_id
join salary S on S.id=es.salary_id
where monthly_salary <2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select *from employee_salary es 
join salary S on S.id = es.salary_id;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary from employee_salary es
join salary S on S.id = es.salary_id 
where monthly_salary  <2000;

--5. Найти всех работников кому не начислена ЗП.

select * from employee_salary es
--join salary S on S.id = es.salary_id 
--join employees e on e.id = es.employee_id 
----where monthly_salary = null

