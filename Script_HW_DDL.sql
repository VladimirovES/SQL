-----------------Таблица employees---------------

create table employees 
	(id serial primary key, employee_name Varchar(50) not null);

-- Вставка одного значение (остальное импортирт cvs)
insert into employees (employee_name)
values ('Evgeniy Vladimirov');

delete from employees
where id >70;

select * from employees;

-------------Таблица salary--------------------------

create table salary
	(id serial primary key, monthly_salary int not null);

insert into salary (id, monthly_salary)
values (default,1000),(default, 1100),(default,1200), (default, 1300),(default,1400),(default,1500), (default ,1600),(default,1700),(default,1800),
(default ,1900),(default,2000),(default,2100),(default,2200),(default,2300), (default,2400), (default, 2500);

select * from salary;

--Т---------аблица employee_salary------------------------------------

create table employee_salary (id serial primary key,employee_id int not null unique, salary_id int not null);

select *from employee_salary;

insert into employee_salary (id, employee_id, salary_id)
values 
(default, 1, 5), (default, 3, 8), (default,4, 10), (default, 2,2),(default, 22, 6), (default, 49, 5),(default, 23,8),(default, 71,1),
(default, 30, 10), (default, 21, 16), (default, 39, 9), (default, 53, 15), (default, 52, 12), (default, 100, 12),(default,51,9),(default, 61,10),
(default, 18, 11), (default, 17, 16), (default, 96, 9),(default, 43, 11), (default, 42,7), (default,55,13), (default,13,14), (default, 60,3),
(default, 11, 1), (default, 81, 2), (default, 32, 4),(default, 87,1), (default, 89, 13), (default, 68,8), (default, 16, 12), (default, 44, 4),
(default,99,9), (default, 88,1), (default, 40,1), (default, 113,3), (default, 31, 9), (default, 72,12),(default,33,1),(default, 15,5);

select * from employee_salary 
where  employee_id >70;
		
drop table employee_salary ;

create table roles (id serial primary key, role_name int not null unique);

select *from roles;

alter table roles
alter column role_name type varchar(50);

insert into roles (id, role_name)
values (default,'Junior Python developer'),
(default,'Middle Python developer'),
(default,'Senior Python developer'),
(default,'Junior Java developer'),
(default,'Middle Java developer'),
(default,'Senior Java developer'),
(default,'Junior JavaScript developer'),
(default,'Middle JavaScript developer'),
(default,'Senior JavaScript developer'),
(default,'Junior Manual QA engineer'),
(default,'Middle Manual QA engineer'),
(default,'Senior Manual QA engineer'),
(default,'Project Manager'),
(default,'Designer'),
(default,'HR'),
(default,'CEO'),
(default,'Sales manager'),
(default,'Junior Automation QA engineer'),
(default,'Middle Automation QA engineer'),
(default,'Senior Automation QA engineer');

--------------Таблица roles_employee------------------

create table roles_employee (
	id serial primary key, 
	employee_id int not null unique,
	role_id Int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
);
		
select * from roles_employee;
drop table roles_employee ;
insert into roles_employee(employee_id,role_id) 
values 
(39,19),
(40,20),
(12,20),
(33,10),
(24,20),
(26,7),
(6,	16),
(22,6),
(21,18),
(4,	13),
(38,4),
(5,	9),
(23,8),
(15,1),
(3,	10),
(18,3),
(8,	13),
(14,11),
(27,2),
(29,14),
(34,10),
(1,	2),
(28,7),
(9,	20),
(25,6),
(32,8),
(10,14),
(2,	13),
(19,1),
(31,16),
(35,17),
(17,8),
(11,8),
(36,8),
(20,19),
(30,5),
(13,10),
(7,	20),
(16,17),
(37,1);

















	