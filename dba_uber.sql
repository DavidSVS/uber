CREATE SEQUENCE types_services_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE types_services (
  Id integer PRIMARY KEY,
  type_services varchar2(10)
  );
  

CREATE SEQUENCE users_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE users(
  Id integer PRIMARY KEY,
  name_user varchar2(255),
  last_name varchar2(255),
  photo varchar2(255),
  email_address varchar2(255),
  email_address2 varchar2(255),
  password_user varchar2(255),
  cellphone_number integer,
  Id_payments integer,
  Id_promotions integer,
  Id_trips integer,
  FOREIGN KEY (Id_payment) REFERENCES  payments (Id),
  FOREIGN KEY (Id_promotions) REFERENCES  promotions (id),
  FOREIGN KEY (Id_trips) REFERENCES trips (id)
);

CREATE SEQUENCE promotions_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE promotions (
  Id integer PRIMARY KEY,
  code_promotion integer,
  Id_user integer
);

CREATE SEQUENCE currency_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE currency (
  Id integer PRIMARY KEY,
  name varchar2(255),
  Id_countries integer,
  FOREIGN KEY (Id_countries) REFERENCES countrys (Id)  
);

CREATE SEQUENCE countries_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE countries (
  Id integer PRIMARY KEY,
  country varchar2(70),
  currency varchar2(255)
);

CREATE SEQUENCE type_fare_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE type_fare (
  Id integer PRIMARY KEY,
  Descripcion varchar2(255)
);

CREATE SEQUENCE shared_services_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE shared_services (
  Id integer PRIMARY KEY,
  Description_trip varchar2(255)
);
CREATE SEQUENCE cities_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE cities (
  Id integer PRIMARY KEY,
  city varchar2(255),
  Id_country  integer,
  FOREIGN KEY (Id_country) REFERENCES countries (Id)  
);

CREATE SEQUENCE account_numbers_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE account_numbers (
  Id integer PRIMARY KEY,
  number_account integer,
  description varchar2(255),
  Id_users integer,
  FOREIGN KEY (Id_users) REFERENCES users (Id) 
);
CREATE SEQUENCE state_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE state (
  Id integer PRIMARY KEY,
  state varchar2(20)
);

CREATE SEQUENCE payments_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE payments (
  Id integer PRIMARY KEY,
  method_payment varchar2(50),
  description varchar2(255),
  Id_account integer,
  FOREIGN KEY (Id_account) REFERENCES account_numbers (Id)
);

CREATE SEQUENCE  cars_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE cars (
  Id integer PRIMARY KEY, 
  Id_driver integer,
  brand varchar2(255),
  Line integer,
  date_car integer,
  license_number varchar2(32),,
  latitude number,
  lenght number,
  Id_trip numeric,
  Id_service_type integer,
  FOREIGN KEY (Id_service_type) REFERENCES types_services (Id), 
  FOREIGN KEY (Id_driver) REFERENCES drivers (Id),
  FOREIGN KEY (Id_trip) REFERENCES trips (Id)
);

CREATE SEQUENCE  trips_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE trips (
  Id integer PRIMARY KEY,
  date_trips timestamp,
  origin_address varchar2(255),
  destination_address varchar2(255),
  distance varchar2(255),
  Id_drivers integer,
  Id_type_fare integer,
  Id_cities integer,
  Id_countries integer,
  Id_shared_services integer,
  Id_state integer,
  Id_types_services integer,
  FOREIGN KEY (Id_drivers) REFERENCES drivers (Id),
  FOREIGN KEY (Id_type_fare) REFERENCES type_fare (Id), 
  FOREIGN KEY (Id_cities) REFERENCES cities (Id) ,
  FOREIGN KEY (Id_countries) REFERENCES countrys (Id), 
  FOREIGN KEY (Id_shared_services) REFERENCES shared_services (Id) ,
  FOREIGN KEY (Id_state) REFERENCES state (Id) ,
  FOREIGN KEY (Id_types_services) REFERENCES types_services (Id) 
);

CREATE SEQUENCE drivers_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE drivers (
  Id integer PRIMARY KEY,
  name varchar2(255),
  last_name varchar2(255),
  email_address varchar2(255),
  email_address2 varchar2(255),
  password varchar2(20),
  cellphone_number integer,
  invite_code varchar2(64),
  Id_cars integer,
  bank_account_number varchar2(32),
  Id_bank integer,
  FOREIGN KEY (Id_cars) REFERENCES cars (Id),
  FOREIGN KEY (Id_bank) REFERENCES banks (Id)
);

CREATE SEQUENCE banks_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE banks (
    Id integer PRIMARY KEY,
    name varchar2(255)
);

CREATE SEQUENCE driver_payment_bill_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE driver_payment_bill (
    Id integer PRIMARY KEY,
    trip_user_bill_id integer,
    payment_date TIMESTAMP,
    uber_fee DECIMAL,
    Id_trip_user integer,
    FOREIGN KEY (Id_trip_user) REFERENCES trip_user_bill (Id)
);

CREATE SEQUENCE trip_user_bill_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE trip_user_bill (
    Id integer PRIMARY KEY,
    trip_user_id integer,
    subtotal DECIMAL,
    user_promotion_code_id  integer,
    total DECIMAL,
    Id_trip integer,
    FOREIGN KEY (Id_trip) REFERENCES trips (Id)
);
