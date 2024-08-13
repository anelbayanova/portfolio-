#   T_TAB1 – товары с описанием (тип товара, кол-во, сумма и продавец)

CREATE DATABASE t_tab;

CREATE TABLE T_TAB1 (
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
GOODS_TYPE VARCHAR(20),
QUANTITY INT,
AMOUNT INT,
SELLER_NAME VARCHAR(20));

INSERT INTO T_TAB1 (ID, GOODS_TYPE, QUANTITY, AMOUNT, SELLER_NAME) 
VALUES  (1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1, 110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');

SELECT * FROM T_TAB1;

CREATE TABLE T_TAB2(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(20),
SALARY INT,
AGE INT);

INSERT INTO T_TAB2 (ID, NAME, SALARY, AGE) 
VALUES (1, 'ANNA', 110000, 27),
(2, 'JANE', 80000, 25),
(3, 'MIKE', 120000, 25),
(4, 'JOE', 70000, 24),
(5, 'RITA', 120000, 29);

SELECT * FROM T_TAB2;

# Задача №1
# Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE).
# Какое количество уникальных категорий товаров вернёт запрос?
SELECT DISTINCT GOODS_TYPE 
FROM T_TAB1;

SELECT COUNT(DISTINCT GOODS_TYPE) AS unique_categories_count
FROM T_TAB1;
#Answer: 4 unique categories

#Задача №2
#Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных 
#мобильных телефонов.
#Какое суммарное количество и суммарную стоимость вернул запрос?
SELECT * FROM T_TAB1;

SELECT GOODS_TYPE,SUM(QUANTITY) AS sum_quantity, SUM(AMOUNT) as sum_amount
FROM t_tab1
WHERE GOODS_TYPE = "MOBILE PHONE"
GROUP BY GOODS_TYPE
;

# sum_quantity = 5, sum_amount = 640000

# Задача №3
#Напишите запрос, который вернёт список сотрудников с заработной платой > 100000.
#Какое кол-во сотрудников вернул запрос?
SELECT NAME, SALARY
FROM T_TAB2
WHERE SALARY > 100000
;
#count of employees is 3 

#Задача №4
#Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, 
# а также минимальную и максимальную заработную плату.
SELECT MIN(AGE), MAX(AGE), MIN(SALARY),MAX(SALARY)
FROM T_TAB2
;

#Задача №5
#Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.
SELECT * FROM T_TAB1;
SELECT GOODS_TYPE, AVG(QUANTITY)
FROM T_TAB1
WHERE GOODS_TYPE IN ("KEYBOARD", "PRINTER")
GROUP BY GOODS_TYPE;

# Задача №6
#Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им 
# товаров.
SELECT SELLER_NAME,SUM(AMOUNT)
FROM T_TAB1
GROUP BY SELLER_NAME;

#Задача №7
#Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, 
# заработную плату и возраст сотрудника MIKE.
SELECT * FROM T_TAB2;
SELECT * FROM T_TAB1;
SELECT t1.SELLER_NAME,t1.GOODS_TYPE, t1.QUANTITY, t1.AMOUNT,t2.SALARY,t2.AGE
FROM t_tab1 t1
JOIN t_tab2 t2 
ON t1.SELLER_NAME = t2.NAME
WHERE t1.SELLER_NAME = "MIKE";

#Задача №8
#Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал.
#Сколько таких сотрудников?
SELECT t1.SELLER_NAME,t2.AGE
FROM t_tab1 t1
JOIN t_tab2 t2 
ON t1.SELLER_NAME = t2.NAME
WHERE t1.QUANTITY = 0;
# there is no employee who did not sell anything

#Задача №9
#Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет?
#Какое количество строк вернул запрос?
SELECT NAME,SALARY,AGE
FROM T_TAB2
WHERE AGE < 26;
# 3 строки

#Задача №10
#Сколько строк вернёт следующий запрос:


SELECT  * 
FROM  T_TAB1 t1
JOIN T_TAB2 t2 ON t2.NAME = t1.SELLER_NAME
WHERE t2.NAME = 'RITA';
# Запись пустая так как только в одной из таблиц, T_TAB2, есть инфрмация о RITA