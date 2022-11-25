--а)Створення класу User_Info_Class
-- DROP TYPE User_Info_Class FORCE;
CREATE OR REPLACE TYPE User_Info_Class AS OBJECT (
    id_user NUMBER(8),
    name VARCHAR(50),
    surname VARCHAR(50),
    e_mail VARCHAR (40),
    phone_number VARCHAR(15),
    bask Basket_Class, -- USER ->(FORM) BAKSER

    /* Процедура зміни значення атрибутів */
    MEMBER PROCEDURE set_e_mail_phone_number(p_id_user NUMBER,p_e_mail VARCHAR, p_phone_number VARCHAR),
	
    /* Процедура отримання значення атрибутів */
    MEMBER FUNCTION get_name RETURN VARCHAR,
	
    -- Процедура вывода на экран содержимого
    NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/


--б)Створення класу Painter_Class
-- DROP TYPE Painter_Class FORCE;
CREATE OR REPLACE TYPE Painter_Class UNDER User_Info_Class (
    id_painter NUMBER(8),
    style VARCHAR(50),
    amount_of_paintings NUMBER(3),
    expirience NUMBER(2),
	
    OVERRIDING MEMBER PROCEDURE display 
);
/


--в)Створення класу Product_Class
-- DROP TYPE Product_Class FORCE;
CREATE OR REPLACE TYPE Product_Class AS OBJECT(
  id_product NUMBER(8),
	name VARCHAR(100),
	price NUMBER(6,2),
	availability VARCHAR(30),
	description VARCHAR(500),
	amount NUMBER(4),
     /* конструктор екземплярів об'єктів класів.
       Вхідні параметри:
	     1) p_name - назва продукту
       2) p_price - ціна продукту
       3) p_availability - доступність продукту
       4) p_description - опис продукту
       5) p_amount - опис продукту на складі
	   умова 1) якщо в таблиці Product вже існує вказаний продукт,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Product створюється новий рядок з одночасним
	   створюється екземпляр класу 
	   Вихідний параметр - екземпляр обєкту класу
	*/
     CONSTRUCTOR FUNCTION Product_Class(p_name VARCHAR,p_price NUMBER, p_availability VARCHAR, p_description VARCHAR,p_amount NUMBER)
     RETURN SELF AS RESULT,

    MEMBER FUNCTION get_name RETURN VARCHAR,
	
    MEMBER FUNCTION get_price RETURN NUMBER,
	
    MEMBER FUNCTION get_availability RETURN VARCHAR,
	
    MEMBER FUNCTION get_description RETURN VARCHAR,
	
    MEMBER FUNCTION get_amount RETURN NUMBER,
    
    MEMBER PROCEDURE display
);
/

--в)Створення Product_list - список типа Product
CREATE TYPE Product_list IS TABLE OF Product_Class;
/


--г)Створення класу Basket_Class
-- DROP TYPE Basket_Class FORCE;
CREATE OR REPLACE TYPE Basket_Class AS OBJECT (

    id_basket NUMBER(8),
    amount_of_product NUMBER(4),
    date_of_creation DATE,
	
    -- Cписок продуктов в корзине
    products Product_list,

    -- объект order типа Order_Class 
    order_inf Order_Class,
    
    MEMBER PROCEDURE display
);
/

--д)Створення класу Order_Class
-- DROP TYPE Order_Class FORCE;
CREATE OR REPLACE TYPE Order_Class AS OBJECT (

    id_order NUMBER(8), -- id замовлення
    general_price NUMBER(6,2), -- ціна замовлення
    SNP VARCHAR(30), -- ПІБ замовника
    adress_of_delivery VARCHAR(50), -- адрес доставки
    phone_number VARCHAR(15), -- Номер телефону замовника
    e_mail VARCHAR (40), -- Електронна адреса замовника
    
    MEMBER PROCEDURE fillOrder(p_id_order NUMBER, p_SNP VARCHAR,p_adress_of_delivery VARCHAR,p_phone_number VARCHAR,p_e_mail VARCHAR),
    
    MEMBER PROCEDURE display
);
/

