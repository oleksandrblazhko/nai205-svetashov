FR2.1 Хужожник оформлює замовлення, клас Order, метод fillOrder()

### 1) вхідні параметри:
1.1) SNP - прізвище ім'я по батькові замовника (рядок символів):
- умова 1) - рядок SNP має довжину до 30 символів;

1.2) adress_of_delivery - адреса доставки замовлення (рядок символів):
- умова 2) - рядок adress_of_delivery має довжину до 50 символів;

1.3) e-mail - електронна адреса, на яку прийде повідомлення після сплати замовлення (рядок символів)
- умова 3) - рядок e-mail задовольняє регулярному виразу '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$';

1.4) phone_number - на який номер телефону буде надіслено повідомлення після сплати замовлення (рядок символів)
- умова 4) - рядок phone_number задовольняє регулярному виразу '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$';

### 2) значення, що повертаються функцією:
- значення = 1 - замовлення оформлено;
- значення = -1 - прізвище ім'я по батькові не відповідає умовам;
- значення = -2 - адреса доставки замовлення не відповідає умовам;
- значення = -3 - електронна адреса не відповідає умовам;
- значення = -4 - номер телефону не відповідає умовам.
