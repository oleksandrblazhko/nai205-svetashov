set serveroutput on;
/*Пример работы с классом Product_Class*/
DECLARE
    pr1 Product_Class;
BEGIN 
    pr1:= NEW Product_Class('Beret',350,'Da','Stlbnaya zamena vaschei chapki',235);
    dbms_output.put_line('get name: ' || pr1.name);
    dbms_output.put_line('get price: ' || pr1.price);
    dbms_output.put_line('get availability: ' || pr1.availability);
    dbms_output.put_line('get description: ' || pr1.description);
    dbms_output.put_line('get amount: ' || pr1.amount);
    pr1.display();
END;
/


/*Пример работы с классом Order_Class*/
DECLARE
    or1 Order_Class;
BEGIN 
    or1:= NEW Order_Class(12345678,2054,NULL,NULL,'0507476512','oodessa13@gmail.com');
    or1.display();
    or1.fillOrder(12345678,'Sviethasov','Wihlem street','0507476523','oodessa15@gmail.com');
    or1.display();
END;
/


/*Пример работы с классами Product_Class, Order_Class, Basket_Class, Product_list*/
DECLARE
    pr1 Product_Class;
    pr2 Product_Class;
    or1 Order_Class;
    bsk1 Basket_Class;
    products Product_list;
BEGIN 
    pr1:= NEW Product_Class('Beret',350,'Da','Stlbnaya zamena vaschei chapki',235);
    pr2:= NEW Product_Class('Shapka',400,'Da','Stlbnaya zamena vaschego bereta',43);
    or1:= NEW Order_Class(12345678,2054,NULL,NULL,'0507476512','oodessa13@gmail.com');
    or1.fillOrder(12345678,'Sviethasov','Wihlem street','0507476523','oodessa15@gmail.com');

    products :=Product_list(pr1,pr2);

    bsk1 := Basket_Class(
                12345678,'2',
                TO_DATE('25/10/2022','DD/MM/YYYY'),
                products,or1
           );
    bsk1.display(); 
END;
/


/*Пример работы с классами Product_Class, Order_Class, Basket_Class, Product_list, User_Info_Class*/
DECLARE
    user1 User_Info_Class;
    bsk1 Basket_Class;
    products Product_list;
    pr1 Product_Class;
    pr2 Product_Class;
    or1 Order_Class;

BEGIN 

    pr1:= NEW Product_Class('Beret',350,'Da','Stlbnaya zamena vaschei chapki',235);
    pr2:= NEW Product_Class('Shapka',400,'Da','Stlbnaya zamena vaschego bereta',43);
    or1:= NEW Order_Class(12345678,2054,NULL,NULL,'0507476512','oodessa13@gmail.com');
    or1.fillOrder(12345678,'Sviethasov','Wihlem street','0507476523','oodessa15@gmail.com');

    products :=Product_list(pr1,pr2);

    bsk1 := Basket_Class(
                12345678,'2',
                TO_DATE('25/10/2022','DD/MM/YYYY'),
                products,or1
           );
           
    user1 :=new User_Info_Class(12345678,'Danya','Svetashov','oodessa12@gmail.com','0407476527',bsk1);
    user1.display();
END;
/
