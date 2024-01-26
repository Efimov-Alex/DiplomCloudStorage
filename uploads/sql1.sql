CREATE TABLE product
(
    id serial primary key,
	name VARCHAR(255),
	price INT
    
);
CREATE TABLE sales
(
    id serial primary key,
	product_id INT,
	date_sale timestamp,
	FOREIGN KEY (product_id) REFERENCES product (id)
    
);
insert into product  (name, price) values ('a', 1);
insert into product  (name, price) values ('b', 2);
insert into sales (product_id, date_sale) values (1, TIMESTAMP '2004-10-19 10:23:54');
insert into sales (product_id, date_sale) values (1, TIMESTAMP '2004-10-19 10:23:54');
insert into sales (product_id, date_sale) values (1, TIMESTAMP '2004-8-19 10:23:54');
insert into sales (product_id, date_sale) values (2, TIMESTAMP '2004-10-19 10:23:54');
insert into sales (product_id, date_sale) values (2, TIMESTAMP '2004-10-19 10:23:54');
insert into sales (product_id, date_sale) values (2, TIMESTAMP '2004-10-19 10:23:54');
insert into sales (product_id, date_sale) values (2, TIMESTAMP '2004-10-19 10:23:54');
SELECT product.id, count(product.id) as ccc FROM sales JOIN product ON product.id = sales.product_id WHERE sales.date_sale 
between '2004-9-19 10:23:54' and '2004-11-19 10:23:54'
group by product.id having COUNT(*) = (SELECT MAX(CC) FROM (SELECT COUNT(*) AS CC FROM sales group by product_id) AS Q);
select max(cc) from (select count(product.id) as cc from product) as q 



update employees set salary = 1.1 * salary where departament = 'IT';
CREATE TABLE employees
(
    id serial primary key,
	salary INT,
	departament VARCHAR(255)
    
);
insert into employees (salary, departament) values (100, 'IT');
insert into employees (salary, departament) values (200, 'IT');
insert into employees (salary, departament) values (100, 'HR');
select * from employees




CREATE TABLE customers
(
    id serial primary key,
	name VARCHAR(255)   
);
CREATE TABLE orders
(
    id serial primary key,
	customer_id INT,
	date_sale timestamp,
	amount INT,
	FOREIGN KEY (customer_id) REFERENCES customers (id)
    
);
insert into customers  (name) values ('a');
insert into customers  (name) values ('b');
insert into orders (customer_id, date_sale, amount) values (1, TIMESTAMP '2004-10-19 10:23:54', 100);
insert into orders (customer_id, date_sale, amount) values (2, TIMESTAMP '2004-10-19 10:23:54', 100);
insert into orders (customer_id, date_sale, amount) values (2, TIMESTAMP '2004-10-19 10:23:54', 100);
SELECT orders.customer_id, sum(amount)  FROM customers JOIN orders ON customers.id = orders.customer_id 
group by orders.customer_id having sum(amount) > 150 ;



CREATE TABLE userr
(
    id serial primary key,
	name VARCHAR(255)   
);
CREATE TABLE transaction
(
    id serial primary key,
	user_id INT,
	date_sale timestamp,
	amount INT,
	FOREIGN KEY (user_id) REFERENCES userr (id)
    
);
insert into userr  (name) values ('a');
insert into userr  (name) values ('b');
insert into transaction (user_id, date_sale, amount) values (1, TIMESTAMP '2004-10-19 10:23:54', 100);
insert into transaction (user_id, date_sale, amount) values (2, TIMESTAMP '2004-10-19 10:23:54', 100);
insert into transaction (user_id, date_sale, amount) values (1, TIMESTAMP '2004-5-19 10:23:54', 100);
insert into transaction (user_id, date_sale, amount) values (1, TIMESTAMP '2004-5-19 10:23:54', 133);
SELECT transaction.user_id , avg(amount)  FROM transaction JOIN userr ON userr.id = transaction.user_id 
where transaction.date_sale between '2004-4-19 10:23:54' and '2004-7-19 10:23:54'
group by transaction.user_id  ;





CREATE TABLE student
(
    id serial primary key,
	name VARCHAR(255),
	major VARCHAR(255)
);
CREATE TABLE grades
(
    id serial primary key,
	student_id INT,
	course INT,
	grade VARCHAR(10),
	FOREIGN KEY (student_id) REFERENCES student (id)
    
);
insert into student  (name, major) values ('a', 'c');
insert into student  (name, major) values ('b', 'c');
insert into grades (student_id, course, grade) values (1, 2, 'A');
insert into grades (student_id, course, grade) values (1, 3, 'A');
insert into grades (student_id, course, grade) values (2, 3, 'A');
insert into grades (student_id, course, grade) values (1, 3, 'b');
insert into grades (student_id, course, grade) values (2, 3, 'b');
SELECT grades.student_id, count(grades.grade)  FROM grades JOIN student ON student.id = grades.student_id where grades.grade = 'A'
group by grades.student_id having count(grades.grade) > 1;




CREATE TABLE locations
(
    id serial primary key,
	city VARCHAR(255),
	country VARCHAR(255),
	latitude numeric,
	longitude numeric
    
);





CREATE TABLE logs
(
    id serial primary key,
	timee timestamp,
	url VARCHAR(255)
    
);
insert into logs (timee, url) values (TIMESTAMP '2004-10-19 10:23:54', 'a');
insert into logs (timee, url) values (TIMESTAMP '2004-10-19 5:23:54', 'a');
insert into logs (timee, url) values (TIMESTAMP '2004-10-19 17:23:54', 'a');
insert into logs (timee, url) values (TIMESTAMP '2004-10-19 23:23:54', 'a');
insert into logs ( timee, url) values (TIMESTAMP '2004-10-19 23:23:54', 'a');

select count(id) from logs where timee::time between '00:00:00' and '06:00:00';
select count(id) from logs where timee::time between '06:00:00' and '12:00:00';
select count(id) from logs where timee::time between '12:00:00' and '18:00:00';
select count(id) from logs where timee::time between '18:00:00' and '24:00:00';




CREATE TABLE author
(
    id serial primary key,
	name VARCHAR(255)   
);
CREATE TABLE book
(
    id serial primary key,
	author_id INT,
	title VARCHAR(255),
	year_book INT,
	FOREIGN KEY (author_id) REFERENCES author (id)
    
);
insert into author  (name) values ('a');
insert into author  (name) values ('b');
insert into book (author_id, year_book, title) values (1, 2021, 'as');
insert into book (author_id, year_book, title) values (1, 2021, 'as');
insert into book (author_id, year_book, title) values (2, 2021, 'as');
insert into book (author_id, year_book, title) values (2, 2019, 'as');
insert into book (author_id, year_book, title) values (1, 2019, 'as');

SELECT book.author_id, count(book.id)  FROM book JOIN author ON author.id = book.author_id 
where book.year_book >= 2020
group by book.author_id having count(book.id) >= 2;




CREATE TABLE web_log_1
(
    id serial primary key,
	user_id INT,
	time timestamp,
	action VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES userr (id)
    
);
select * from web_log
insert into web_log_1 (user_id, time, action) values (1, TIMESTAMP '2004-10-19 10:23:54', 'log');
insert into web_log_1 (user_id, time, action) values (1, TIMESTAMP '2004-10-19 10:23:55', 'log');
insert into web_log_1 (user_id, time, action) values (1, TIMESTAMP '2004-10-19 10:23:56', 'log');
insert into web_log_1 (user_id, time, action) values (1, TIMESTAMP '2004-10-19 10:33:54', 'end');
insert into web_log_1 (user_id, time, action) values (1, TIMESTAMP '2004-10-19 10:56:54', 'end');

insert into web_log_1 (user_id, time, action) values (2, TIMESTAMP '2004-10-19 11:23:56', 'log');
insert into web_log_1 (user_id, time, action) values (2, TIMESTAMP '2004-11-19 10:33:54', 'log');
insert into web_log_1 (user_id, time, action) values (2, TIMESTAMP '2004-10-19 13:56:54', 'end');

select user_id, date_trunc('day', time), max(time) from web_log_1
where action = 'log'
group by user_id, date_trunc('day', time);


select user_id, date_trunc('day', time) as dat,
(select min(time) from web_log_1 where action = 'end' and date_trunc('day', time) = dat group by user_id, date_trunc('day', time))
from web_log_1
group by user_id, date_trunc('day', time);

select user_id, date_trunc('day', time), min(time) from web_log_1 where action = 'end'  group by user_id, date_trunc('day', time);

select user_id, date_trunc('day', time), max(time) from web_log_1 where action = 'log'  group by user_id, date_trunc('day', time);






CREATE TABLE CustomerPurchases
(
    id serial primary key,
	amount INT,
	purchase_date timestamp,
	product_category VARCHAR(255)
	
    
);
insert into CustomerPurchases (amount, purchase_date, product_category) values (2, TIMESTAMP '2004-10-19 11:23:56', 'food');
insert into CustomerPurchases (amount, purchase_date, product_category) values (2, TIMESTAMP '2004-10-19 11:24:56', 'food');
insert into CustomerPurchases (amount, purchase_date, product_category) values (2, TIMESTAMP '2004-10-19 11:23:56', 'good');
insert into CustomerPurchases (amount, purchase_date, product_category) values (2, TIMESTAMP '2004-10-19 11:21:56', 'good');
select product_category, count(id) from CustomerPurchases group by product_category;
select product_category, count(id) from CustomerPurchases where purchase_date > '2004-10-19 11:23:56' group by product_category;
select product_category from CustomerPurchases order by purchase_date DESC;




create schema university;

CREATE TABLE university.student
(
    id serial primary key,
	name VARCHAR(255),
	surname VARCHAR(255),
	patronomyc VARCHAR(255),
	sex boolean,
	group_number VARCHAR(255)
	
    
);


CREATE TABLE university.teacher
(
    id serial primary key,
	name VARCHAR(255),
	surname VARCHAR(255),
	patronomyc VARCHAR(255),
	sex boolean,
	experience INT
	
    
);


CREATE TABLE university.estimation
(
    id serial primary key,
	estimation VARCHAR(255)
	  
);
CREATE TABLE university.course
(
    id serial primary key,
	teacher_id INT,
	hours VARCHAR(10),
	FOREIGN KEY (teacher_id) REFERENCES university.teacher (id)
	  
);
alter table university.estimation add column course_id INT REFERENCES university.course (id);

CREATE TABLE university.student_to_teacher (
  student_id INT,
  teacher_id INT,
  PRIMARY KEY (student_id, teacher_id),
  CONSTRAINT fk_student FOREIGN KEY(student_id) REFERENCES university.student(id),
  CONSTRAINT fk_teacher FOREIGN KEY(teacher_id) REFERENCES university.teacher(id)
)


create schema library;



CREATE TABLE IF NOT EXISTS library."Книги"
(
    id serial,
    name character varying(255) NOT NULL,
    author character varying NOT NULL,
    cost integer NOT NULL,
    count integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS library."Учет книг"
(
    "Number" serial,
    book_id integer NOT NULL,
    PRIMARY KEY ("Number")
);

alter table library."Учет книг" ADD UNIQUE (book_id)

CREATE TABLE IF NOT EXISTS library."Читатели"
(
    "number" serial,
    "Date_of_birth" date NOT NULL,
    "FIO" character varying(255) NOT NULL,
    "Adress" character varying(25) NOT NULL,
    PRIMARY KEY ("number")
);

CREATE TABLE IF NOT EXISTS library."Движение книг"
(
    resder_id integer,
    invertar_id integer,
    date_get date NOT NULL,
    date_return date NOT NULL,
    PRIMARY KEY (resder_id, invertar_id)
);
alter table library."Движение книг" ADD UNIQUE (resder_id);
alter table library."Движение книг" ADD UNIQUE (invertar_id);

CREATE TABLE IF NOT EXISTS library."Штраф"
(
    reader_id integer,
    "FIO" character varying(255) NOT NULL,
    "Book_title" character varying,
    "Cost" integer NOT NULL,
    size_fine integer,
    PRIMARY KEY (reader_id, "Book_title", size_fine)
);

ALTER TABLE IF EXISTS library."Книги"
    ADD FOREIGN KEY (id)
    REFERENCES library."Учет книг" (book_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS library."Учет книг"
    ADD FOREIGN KEY ("Number")
    REFERENCES library."Движение книг" (invertar_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS library."Читатели"
    ADD FOREIGN KEY ("number")
    REFERENCES library."Движение книг" (resder_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS library."Штраф"
    ADD FOREIGN KEY (reader_id)
    REFERENCES library."Читатели" ("number") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


create schema internet_shop;


CREATE TABLE IF NOT EXISTS internet_shop."Клиент"
(
    "Код клиента" serial,
    "ФИО" character varying(255) NOT NULL,
    "Дата рождения" date NOT NULL,
    "Адрес" character varying(255),
    "Телефон" character varying(14) NOT NULL,
    PRIMARY KEY ("Код клиента")
);

CREATE TABLE IF NOT EXISTS internet_shop."Товар"
(
    "Код товара" serial,
    "Название" character varying(255) NOT NULL,
    "Категория" character varying(255) NOT NULL,
    "Цена" integer NOT NULL,
    "Код поставщика" integer NOT NULL,
    "Колличество" integer NOT NULL,
    PRIMARY KEY ("Код товара")
);

CREATE TABLE IF NOT EXISTS internet_shop."Поставщик"
(
    "Код поставщика" serial,
    "Название" character varying(255) NOT NULL,
    "Адрес" character varying(255) NOT NULL,
    "Телефон" character varying(14) NOT NULL,
    PRIMARY KEY ("Код поставщика")
);

CREATE TABLE IF NOT EXISTS internet_shop."Способ оплаты"
(
    "Код клиента" serial,
    "Способ оплаты" character varying(255) NOT NULL,
    PRIMARY KEY ("Код клиента")
);

CREATE TABLE IF NOT EXISTS internet_shop."Заказ"
(
    "Код заказа" serial,
    "Код клиента" integer NOT NULL,
    "Адрес получателя" character varying(255) NOT NULL,
    "Дата доставки" date NOT NULL,
    "Код доставки" integer NOT NULL,
    "Стоимость доставки" integer NOT NULL,
    PRIMARY KEY ("Код заказа")
);

CREATE TABLE IF NOT EXISTS internet_shop."Доставка"
(
    "Код доставки" serial,
    "Способ доставки" character varying(255) NOT NULL,
    PRIMARY KEY ("Код доставки")
);

CREATE TABLE IF NOT EXISTS internet_shop."Товар_Заказ"
(
    "Товар_Код товара" serial,
    "Заказ_Код заказа" serial
);

ALTER TABLE IF EXISTS internet_shop."Клиент"
    ADD FOREIGN KEY ("Код клиента")
    REFERENCES internet_shop."Способ оплаты" ("Код клиента") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS internet_shop."Товар"
    ADD FOREIGN KEY ("Код поставщика")
    REFERENCES internet_shop."Поставщик" ("Код поставщика") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS internet_shop."Заказ"
    ADD FOREIGN KEY ("Код клиента")
    REFERENCES internet_shop."Клиент" ("Код клиента") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS internet_shop."Заказ"
    ADD FOREIGN KEY ("Код доставки")
    REFERENCES internet_shop."Доставка" ("Код доставки") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS internet_shop."Товар_Заказ"
    ADD FOREIGN KEY ("Товар_Код товара")
    REFERENCES internet_shop."Товар" ("Код товара") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS internet_shop."Товар_Заказ"
    ADD FOREIGN KEY ("Заказ_Код заказа")
    REFERENCES internet_shop."Заказ" ("Код заказа") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



create schema hotel



CREATE TABLE IF NOT EXISTS hotel."Клиент"
(
    "Код клиента" serial,
    "ФИО" character varying(255) NOT NULL,
    "Паспортные данные" character varying NOT NULL,
    PRIMARY KEY ("Код клиента")
);

CREATE TABLE IF NOT EXISTS hotel."Название"
(
    "Код номера" serial,
    "Номер комнаты" integer NOT NULL,
    "Этаж" integer NOT NULL,
    "Число мест" integer NOT NULL,
    "Стоимость" integer NOT NULL,
    "Категория" character varying(255) NOT NULL,
    PRIMARY KEY ("Код номера")
);

CREATE TABLE IF NOT EXISTS hotel."Оплата"
(
    "Код клиента" serial,
    "Код номера" serial,
    "Дата приезда" date NOT NULL,
    "Дата выезда" date NOT NULL,
    PRIMARY KEY ("Код клиента", "Код номера")
);

CREATE TABLE IF NOT EXISTS hotel."Бронирование"
(
    "Номер бронирования" serial,
    "Дата бронирования" date NOT NULL,
    "Код номера" integer NOT NULL,
    "Код клиента" integer NOT NULL,
    PRIMARY KEY ("Номер бронирования")
);

ALTER TABLE IF EXISTS hotel."Оплата"
    ADD FOREIGN KEY ("Код клиента")
    REFERENCES hotel."Клиент" ("Код клиента") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS hotel."Оплата"
    ADD FOREIGN KEY ("Код номера")
    REFERENCES hotel."Название" ("Код номера") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS hotel."Бронирование"
    ADD FOREIGN KEY ("Код клиента")
    REFERENCES hotel."Клиент" ("Код клиента") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;





ALTER TABLE IF EXISTS hotel."Бронирование"
    ADD FOREIGN KEY ("Код номера")
    REFERENCES hotel."Название" ("Код номера") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;




create schema food




CREATE TABLE IF NOT EXISTS food."Продукты"
(
    "Код продукта" serial,
    "Название" character varying(255) NOT NULL,
    PRIMARY KEY ("Код продукта")
);

CREATE TABLE IF NOT EXISTS food."Блюда"
(
    "Код блюда" serial,
    "Название" character varying(255) NOT NULL,
    "Колличество" integer NOT NULL,
    "Категория" character varying(255) NOT NULL,
    "Цена" integer NOT NULL,
    PRIMARY KEY ("Код блюда")
);

CREATE TABLE IF NOT EXISTS food."Что заказано"
(
    "Номер" serial,
    "Код заказа" integer NOT NULL,
    "Код блюда" integer NOT NULL,
    PRIMARY KEY ("Номер")
);

CREATE TABLE IF NOT EXISTS food."Заказ"
(
    "Код заказа" serial,
    "Дата" date NOT NULL,
    "Время" time with time zone NOT NULL,
    "Стол" integer NOT NULL,
    "Выполнен" boolean NOT NULL,
    "Код сотрудника" integer NOT NULL,
    PRIMARY KEY ("Код заказа")
);

CREATE TABLE IF NOT EXISTS food."Стол"
(
    "Код стола" serial,
    "Описание" character varying NOT NULL,
    PRIMARY KEY ("Код стола")
);

CREATE TABLE IF NOT EXISTS food."Сотрудник"
(
    "Код сотрудника" serial,
    "ФИО" character varying(255) NOT NULL,
    PRIMARY KEY ("Код сотрудника")
);

CREATE TABLE IF NOT EXISTS food."Продукты_Блюда"
(
    "Продукты_Код продукта" serial,
    "Блюда_Код блюда" serial
);

ALTER TABLE IF EXISTS food."Что заказано"
    ADD FOREIGN KEY ("Код заказа")
    REFERENCES food."Заказ" ("Код заказа") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS food."Что заказано"
    ADD FOREIGN KEY ("Код блюда")
    REFERENCES food."Блюда" ("Код блюда") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS food."Заказ"
    ADD FOREIGN KEY ("Стол")
    REFERENCES food."Стол" ("Код стола") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS food."Заказ"
    ADD FOREIGN KEY ("Код сотрудника")
    REFERENCES food."Сотрудник" ("Код сотрудника") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS food."Продукты_Блюда"
    ADD FOREIGN KEY ("Продукты_Код продукта")
    REFERENCES food."Продукты" ("Код продукта") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS food."Продукты_Блюда"
    ADD FOREIGN KEY ("Блюда_Код блюда")
    REFERENCES food."Блюда" ("Код блюда") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;





CREATE TABLE DeliveryData_1
(
    id serial primary key,
	route VARCHAR(255),
	time_delivery INT,
	cost INT
	
    
);


INSERT INTO DeliveryData_1 (route, time_delivery, cost) values ('Стромынка 20', 34, 200);
INSERT INTO DeliveryData_1 (route, time_delivery, cost) values ('Стромынка 20', 33, 200)
delete  from DeliveryData

select * from DeliveryData_1 order by cost, time_delivery asc





























