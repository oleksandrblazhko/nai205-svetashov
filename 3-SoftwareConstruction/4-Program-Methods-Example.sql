/* Методи класу Product_Class */
-- DROP TYPE Product_Class FORCE;
CREATE OR REPLACE TYPE BODY Product_Class AS
 
    CONSTRUCTOR FUNCTION Product_Class(p_name VARCHAR,p_price NUMBER, p_availability VARCHAR, p_description VARCHAR,p_amount NUMBER)
        RETURN SELF AS RESULT
    IS
        v_id_product product.id_product%TYPE;

    BEGIN
        SELECT id_product INTO v_id_product
        FROM Product
        WHERE 
        name=p_name;
        SELF.id_product :=v_id_product;
        SELF.name :=p_name;
        SELF.price :=p_price;
        SELF.availability := p_availability;
        SELF.description := p_description;
        SELF.amount :=p_amount;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Product (name,price,availability,description,amount)
            VALUES(p_name,p_price,p_availability,p_description,p_amount)
        RETURNING id_product INTO v_id_product;
        SELF.id_product :=v_id_product;
        SELF.name := p_name;
        SELF.price :=p_price;
        SELF.availability := p_availability;
        SELF.description := p_description;
        SELF.amount :=p_amount;
        RETURN;
    END Product_Class;


    MEMBER FUNCTION get_name
        RETURN VARCHAR
    IS
    BEGIN
        RETURN SELF.name;
    END get_name;


    MEMBER FUNCTION get_price
        RETURN NUMBER
    IS
    BEGIN
        RETURN SELF.price;
    END get_price;


    MEMBER FUNCTION get_availability
        RETURN VARCHAR
    IS
    BEGIN
        RETURN SELF.availability;
    END get_availability;


    MEMBER FUNCTION get_description
        RETURN VARCHAR
    IS
    BEGIN
        RETURN SELF.description;
    END get_description;


    MEMBER FUNCTION get_amount
        RETURN NUMBER
    IS
    BEGIN
        RETURN SELF.amount;
    END get_amount;


    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('name: ' || name);
        dbms_output.put_line('price: ' || price);
        dbms_output.put_line('availability: ' || availability);
        dbms_output.put_line('description: ' || description);
        dbms_output.put_line('amount: ' || amount);
    END display;
END;
/



/* Методи класу Order_Class */
CREATE OR REPLACE TYPE BODY Order_Class AS
    
    MEMBER PROCEDURE fillOrder(p_id_order NUMBER, p_SNP VARCHAR,p_adress_of_delivery VARCHAR,p_phone_number VARCHAR,p_e_mail VARCHAR)
	IS
	BEGIN
        UPDATE Order_Info SET 
        SNP = p_SNP
        WHERE id_order=p_id_order;
        SELF.SNP := p_SNP;
    
        UPDATE Order_Info SET     
        adress_of_delivery = p_adress_of_delivery
        WHERE id_order=p_id_order;
        SELF.adress_of_delivery := p_adress_of_delivery;
        
        UPDATE Order_Info SET 
        phone_number=p_phone_number
        WHERE id_order=p_id_order;
        SELF.phone_number := p_phone_number;
        
        
        UPDATE Order_Info SET 
        e_mail=p_e_mail
        WHERE id_order=p_id_order;
        SELF.e_mail := p_e_mail;
        
	END fillOrder;
    

    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('name: ' || SNP);
        dbms_output.put_line('adress_of_delivery: ' || adress_of_delivery);
        dbms_output.put_line('phone_number: ' || phone_number);
        dbms_output.put_line('e_mail: ' || e_mail);
    END display;
END;
/



/* Методи класу Basket_Class */
CREATE OR REPLACE TYPE Body Basket_Class AS

MEMBER PROCEDURE display 
IS
BEGIN
    dbms_output.put_line('id_basket: '|| self.id_basket); 
    dbms_output.put_line('amount_of_product: '|| self.amount_of_product);
    dbms_output.put_line('date_of_creation: '|| self.date_of_creation); 
    dbms_output.put_line('SNP: '|| order_inf.SNP); 
    dbms_output.put('Products: {'); 
        FOR i IN 1..products.COUNT LOOP
            dbms_output.put(products(i).name);
            IF i < products.COUNT THEN 
                dbms_output.put(',');
            END IF;
        END LOOP;
        dbms_output.put_line('}');
    END display; 
END;
/



/* Методи класу User_Info_Class */
CREATE OR REPLACE TYPE BODY User_Info_Class AS

	MEMBER PROCEDURE set_e_mail_phone_number(p_id_user NUMBER, p_e_mail VARCHAR, p_phone_number VARCHAR)
	IS
	BEGIN
        UPDATE User_Info SET e_mail = p_e_mail
		WHERE id_user = p_id_user;
		SELF.e_mail := p_e_mail;

        UPDATE User_Info SET phone_number = p_phone_number
		WHERE id_user = p_id_user;
		SELF.phone_number := p_phone_number;

	END set_e_mail_phone_number;


MEMBER FUNCTION get_name
	    RETURN VARCHAR
	IS
    BEGIN
       RETURN SELF.name;
    END get_name;

    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Name: ' || name); 
        dbms_output.put_line('Surname: ' || surname); 
        dbms_output.put_line('Phone: ' || phone_number); 
    END display; 

END;
/

/* Методи класу Painter_Class */
CREATE OR REPLACE TYPE BODY Painter_Class AS 
    OVERRIDING MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Name: ' || self.name); 
        dbms_output.put_line('Surname: ' || self.surname); 
        dbms_output.put_line('Phone: ' || self.phone_number); 
        dbms_output.put_line('Style: ' || style); 
    END display; 
END; 
/
