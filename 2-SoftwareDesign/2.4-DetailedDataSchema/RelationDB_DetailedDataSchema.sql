drop table Order_Info CASCADE CONSTRAINTS;
drop table Basket CASCADE CONSTRAINTS;
drop table User_Info CASCADE CONSTRAINTS;
drop table Painter CASCADE CONSTRAINTS;
drop table Product CASCADE CONSTRAINTS;
drop table Basket_Product CASCADE CONSTRAINTS;

CREATE TABLE Order_Info( -- Замовлення
    id_order NUMBER(8), -- id замовлення
    general_price NUMBER(6,2), -- ціна замовлення
    SNP VARCHAR(30), -- ПІБ замовника
    adress_of_delivery VARCHAR(50), -- адрес доставки
    phone_number VARCHAR(15), -- Номер телефону замовника
    e_mail VARCHAR (40), -- Електронна адреса замовника
    id_basket NUMBER(8) -- id кошику
);

CREATE TABLE Basket( -- Кошик
    id_basket NUMBER(8), -- id кошику
    amount_of_product NUMBER(4), -- Кількість товарів у кошику
    date_of_creation DATE,
	id_user NUMBER(8)
);

CREATE TABLE User_Info(
	id_user NUMBER(8),
	name VARCHAR(50),
	surname VARCHAR(50),
	e_mail VARCHAR (40),
	phone_number VARCHAR(15)
);

CREATE TABLE Painter(
	id_painter NUMBER(8),
	style VARCHAR(50),
	amount_of_paintings NUMBER(3),
	expirience NUMBER(2),
	id_user NUMBER(8)
);

CREATE TABLE Product(
	id_product NUMBER(8),
	name VARCHAR(100),
	price NUMBER(6,2),
	availability VARCHAR(30),
	description VARCHAR(500),
	amount NUMBER(4)
);

CREATE TABLE Basket_Product(
	id_basket NUMBER(8),
	id_product NUMBER(8)
);



--User_Info
ALTER TABLE User_Info ADD CONSTRAINT pk_user_info
	PRIMARY KEY(id_user);
	
	ALTER TABLE User_Info MODIFY (name NOT NULL);
	ALTER TABLE User_Info MODIFY (surname NOT NULL);
	ALTER TABLE User_Info MODIFY (e_mail NOT NULL);
	
	
--Basket
ALTER TABLE Basket ADD CONSTRAINT pk_basket
	PRIMARY KEY(id_basket);
	
ALTER TABLE Basket ADD CONSTRAINT amount_of_product_range
	CHECK(amount_of_product>=0);
	
ALTER TABLE Basket ADD CONSTRAINT fk_id_user_basket
	FOREIGN KEY(id_user)
	REFERENCES User_Info(id_user);
	
--Order_Info
ALTER TABLE Order_Info ADD CONSTRAINT pk_order_info
	PRIMARY KEY(id_order);
	
ALTER TABLE Order_Info ADD CONSTRAINT general_price_range
	CHECK(general_price>=0);
    
ALTER TABLE Order_Info MODIFY (e_mail NOT NULL);
    
ALTER TABLE Order_Info MODIFY (SNP NOT NULL);
    
	
ALTER TABLE Order_Info ADD CONSTRAINT fk_id_basket_order_info
	FOREIGN KEY(id_basket)
	REFERENCES Basket(id_basket);
	

--Painter
ALTER TABLE Painter ADD CONSTRAINT pk_painter
	PRIMARY KEY(id_painter);
	
ALTER TABLE Painter ADD CONSTRAINT expirience_range
	CHECK(expirience >=0);
	
	ALTER TABLE Painter MODIFY (amount_of_paintings NOT NULL);

ALTER TABLE Painter ADD CONSTRAINT fk_id_user_painter
	FOREIGN KEY(id_user)
	REFERENCES User_Info(id_user);
	
--Product
ALTER TABLE Product ADD CONSTRAINT pk_product
	PRIMARY KEY(id_product);
	
ALTER TABLE Product ADD CONSTRAINT price_range
	CHECK(price>=0);
	
ALTER TABLE Product MODIFY (name NOT NULL);
ALTER TABLE Product MODIFY (availability NOT NULL);
ALTER TABLE Product MODIFY (description NOT NULL);

--Basket_Product (Асоциативна сутність)
ALTER TABLE Basket_Product MODIFY
id_basket REFERENCES Basket(id_basket);

ALTER TABLE Basket_Product MODIFY
id_product REFERENCES Product(id_product);

ALTER TABLE Basket_Product ADD CONSTRAINT pk_id_basket_id_product
primary key(id_basket, id_product);


--Регулярні вирази
ALTER TABLE User_Info ADD CONSTRAINT e_mail_template
    CHECK (regexp_like(e_mail, '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));
	
ALTER TABLE User_Info ADD CONSTRAINT user_phone_template
    CHECK ( regexp_like(phone_number, '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
    
ALTER TABLE Order_Info ADD CONSTRAINT e_mail_template1
    CHECK (regexp_like(e_mail, '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));
    
ALTER TABLE Order_Info ADD CONSTRAINT user_phone_template1
    CHECK ( regexp_like(phone_number, '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
	
