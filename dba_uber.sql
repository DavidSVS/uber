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
  Id_countrys integer,
  FOREIGN KEY (Id_countrys) REFERENCES countrys (Id)  
);

CREATE SEQUENCE countrys_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE countrys (
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
  FOREIGN KEY (Id_country) REFERENCES countrys (Id)  
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
  license_number   VARCHAR2(32),
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
  Id_citys integer,
  Id_countrys integer,
  Id_shared_services integer,
  Id_state integer,
  Id_types_services integer,
  FOREIGN KEY (Id_drivers) REFERENCES drivers (Id),
  FOREIGN KEY (Id_type_fare) REFERENCES type_fare (Id), 
  FOREIGN KEY (Id_citys) REFERENCES cities (Id) ,
  FOREIGN KEY (Id_countrys) REFERENCES countrys (Id), 
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
  bank_account_number   integer,
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
    name   varchar2(255)
);

CREATE SEQUENCE driver_payment_bills_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE driver_payment_bills (
    Id integer PRIMARY KEY,
    trip_user_bill_id integer,
    payment_date TIMESTAMP,
    uber_fee DECIMAL,
    Id_trip_user integer,
    FOREIGN KEY (Id_trip_user) REFERENCES trip_user_bills (Id)
);

CREATE SEQUENCE trip_user_bills_sec
INCREMENT BY 1
START WITH 1
MAXVALUE 1000
MINVALUE 1
NOCYCLE
NOORDER;

CREATE TABLE trip_user_bills (
    Id integer PRIMARY KEY,
    trip_user_id integer,
    subtotal DECIMAL,
    user_promotion_code_id  integer,
    total DECIMAL,
    Id_trip integer,
    FOREIGN KEY (Id_trip) REFERENCES trips (Id)
);

insert into types_services (Id, tipe_services) values (1, 'UberX');
insert into types_services (Id, tipe_services) values (1001, 'Uber_Blak');

insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (1, 'Franky Haccleton', 'Haccleton', 'http://dummyimage.com/216x250.bmp/ff4444/ffffff', 'fhaccleton0@tumblr.com', 'fhaccleton0@epa.gov', 'C6oLsKUmqAgc', '3356743261');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (1001, 'Stanley Balducci', 'Balducci', 'http://dummyimage.com/134x169.png/ff4444/ffffff', 'sbalducci1@patch.com', 'sbalducci1@columbia.edu', 'L2SV7E8o7VHe', '1422686047');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (2001, 'Marika Sheard', 'Sheard', 'http://dummyimage.com/136x146.jpg/5fa2dd/ffffff', 'msheard2@delicious.com', 'msheard2@google.pl', 'cuu5JrP13Q', '5514496647');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (3001, 'Clay Phillpotts', 'Phillpotts', 'http://dummyimage.com/121x189.png/ff4444/ffffff', 'cphillpotts3@surveymonkey.com', 'cphillpotts3@imgur.com', 'SGg4mwLF9', '5179062611');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (4001, 'Donna Clemmitt', 'Clemmitt', 'http://dummyimage.com/206x114.jpg/ff4444/ffffff', 'dclemmitt4@aboutads.info', 'dclemmitt4@deviantart.com', 'Oy3kI1H69Y0S', '8437621766');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (5001, 'Melitta Sporner', 'Sporner', 'http://dummyimage.com/242x142.png/5fa2dd/ffffff', 'msporner5@slate.com', 'msporner5@delicious.com', 'treiBmOH', '7578030226');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (6001, 'Thomasin Oleszkiewicz', 'Oleszkiewicz', 'http://dummyimage.com/240x183.jpg/cc0000/ffffff', 'toleszkiewicz6@seattletimes.com', 'toleszkiewicz6@pbs.org', '3Z2bVV', '8092370727');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (7001, 'Marcelle Simonaitis', 'Simonaitis', 'http://dummyimage.com/157x207.bmp/cc0000/ffffff', 'msimonaitis7@booking.com', 'msimonaitis7@icq.com', 'KGMys9wUC', '9399574372');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (8001, 'Keen Hennington', 'Hennington', 'http://dummyimage.com/157x188.jpg/dddddd/000000', 'khennington8@merriam-webster.com', 'khennington8@mtv.com', 'qV7hZtGM', '6637991531');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (9001, 'Vernice Berry', 'Berry', 'http://dummyimage.com/199x217.png/dddddd/000000', 'vberry9@so-net.ne.jp', 'vberry9@edublogs.org', 'ID3vdHWfR0B', '9555569596');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (10001, 'Sianna O''Nion', 'O''Nion', 'http://dummyimage.com/168x107.png/cc0000/ffffff', 'soniona@opera.com', 'soniona@tinyurl.com', 'D2UtdEKjFhKn', '2553884697');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (11001, 'Freddy Kirtlan', 'Kirtlan', 'http://dummyimage.com/194x181.bmp/ff4444/ffffff', 'fkirtlanb@state.tx.us', 'fkirtlanb@sciencedirect.com', 'jqwmJra4C8py', '8329118385');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (12001, 'Janine Doust', 'Doust', 'http://dummyimage.com/201x240.jpg/dddddd/000000', 'jdoustc@geocities.com', 'jdoustc@dell.com', 'U2UUNm1h', '9126849616');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (13001, 'Gennie Forten', 'Forten', 'http://dummyimage.com/188x237.png/ff4444/ffffff', 'gfortend@parallels.com', 'gfortend@zdnet.com', 'KQJrPGVrd', '8041635030');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (14001, 'Darrelle Adiscot', 'Adiscot', 'http://dummyimage.com/237x185.png/ff4444/ffffff', 'dadiscote@tamu.edu', 'dadiscote@theatlantic.com', 'eiLCNEj', '8876949446');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (15001, 'Fara Grange', 'Grange', 'http://dummyimage.com/101x115.bmp/cc0000/ffffff', 'fgrangef@angelfire.com', 'fgrangef@ameblo.jp', 'MFugBDaB', '9995861230');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (16001, 'Land Lunge', 'Lunge', 'http://dummyimage.com/104x153.jpg/cc0000/ffffff', 'llungeg@vk.com', 'llungeg@yale.edu', 'oVN9hWvHtHW', '9024027156');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (17001, 'Bary O'' Borne', 'O'' Borne', 'http://dummyimage.com/249x234.jpg/5fa2dd/ffffff', 'boh@blog.com', 'boh@cafepress.com', 'yOijXgXRH', '4653115479');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (18001, 'Baillie Petigrew', 'Petigrew', 'http://dummyimage.com/219x208.bmp/cc0000/ffffff', 'bpetigrewi@topsy.com', 'bpetigrewi@pcworld.com', 't7BS8j5o', '6358582058');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (19001, 'Maurine Keig', 'Keig', 'http://dummyimage.com/247x184.png/cc0000/ffffff', 'mkeigj@myspace.com', 'mkeigj@oracle.com', 'ZGBj1J409Be', '1679527295');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (20001, 'Frederigo Czajka', 'Czajka', 'http://dummyimage.com/121x174.png/ff4444/ffffff', 'fczajkak@sfgate.com', 'fczajkak@miibeian.gov.cn', 'LMz96aBp7p2a', '1501034527');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (21001, 'Martino Vaughton', 'Vaughton', 'http://dummyimage.com/191x210.png/ff4444/ffffff', 'mvaughtonl@hatena.ne.jp', 'mvaughtonl@xrea.com', '6uLDslhCu', '3692640141');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (22001, 'Frazer MacVicar', 'MacVicar', 'http://dummyimage.com/237x201.jpg/ff4444/ffffff', 'fmacvicarm@addtoany.com', 'fmacvicarm@utexas.edu', 'hTwqmpm6v', '4773612353');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (23001, 'Cecil Cubbon', 'Cubbon', 'http://dummyimage.com/139x114.bmp/dddddd/000000', 'ccubbonn@a8.net', 'ccubbonn@bloglovin.com', 'QGmaT4s', '6329450820');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (24001, 'Lyssa Indgs', 'Indgs', 'http://dummyimage.com/116x238.png/dddddd/000000', 'lindgso@desdev.cn', 'lindgso@discuz.net', 'tzrxcDMTc', '1402250941');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (25001, 'Hansiain Holley', 'Holley', 'http://dummyimage.com/132x147.png/ff4444/ffffff', 'hholleyp@last.fm', 'hholleyp@psu.edu', 'kM97GrMlHz', '1304354052');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (26001, 'Kariotta McVanamy', 'McVanamy', 'http://dummyimage.com/125x149.bmp/5fa2dd/ffffff', 'kmcvanamyq@vk.com', 'kmcvanamyq@about.me', 'rvLgTGBy', '5456507799');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (27001, 'Harli Yakobowitch', 'Yakobowitch', 'http://dummyimage.com/201x132.bmp/5fa2dd/ffffff', 'hyakobowitchr@dailymotion.com', 'hyakobowitchr@flavors.me', 'N7kFjlS13x', '7007826585');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (28001, 'Shirlene Meegan', 'Meegan', 'http://dummyimage.com/141x145.bmp/dddddd/000000', 'smeegans@google.ca', 'smeegans@usnews.com', 'DtRZU5', '9906363451');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (29001, 'Gabey Merrell', 'Merrell', 'http://dummyimage.com/167x135.jpg/dddddd/000000', 'gmerrellt@kickstarter.com', 'gmerrellt@discovery.com', 'm3LgOmO', '2819052851');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (30001, 'Nathalie Sandell', 'Sandell', 'http://dummyimage.com/183x112.jpg/cc0000/ffffff', 'nsandellu@free.fr', 'nsandellu@japanpost.jp', 'uUHYXBWynw', '4295044192');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (31001, 'Theresina Blasio', 'Blasio', 'http://dummyimage.com/204x221.jpg/dddddd/000000', 'tblasiov@cornell.edu', 'tblasiov@umich.edu', 'HCZP233dDU', '8041254806');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (32001, 'Robinet Carlucci', 'Carlucci', 'http://dummyimage.com/250x246.png/ff4444/ffffff', 'rcarlucciw@abc.net.au', 'rcarlucciw@i2i.jp', 'mZ28Oe3Qt4f', '3497485142');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (33001, 'Bel Huffer', 'Huffer', 'http://dummyimage.com/235x216.jpg/5fa2dd/ffffff', 'bhufferx@about.com', 'bhufferx@geocities.com', '2gbddMSXgwp', '3434068807');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (34001, 'Mahmoud Coram', 'Coram', 'http://dummyimage.com/214x116.png/cc0000/ffffff', 'mcoramy@homestead.com', 'mcoramy@china.com.cn', '2BMmOJEhyddu', '1085881009');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (35001, 'Micky Cridge', 'Cridge', 'http://dummyimage.com/243x148.bmp/5fa2dd/ffffff', 'mcridgez@storify.com', 'mcridgez@slate.com', 'z6WsTBW5m', '1405210123');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (36001, 'Vanda Aglione', 'Aglione', 'http://dummyimage.com/250x177.png/cc0000/ffffff', 'vaglione10@google.com.br', 'vaglione10@utexas.edu', 'RnX8LVa', '9075031265');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (37001, 'Jobye Joinson', 'Joinson', 'http://dummyimage.com/117x216.bmp/5fa2dd/ffffff', 'jjoinson11@umich.edu', 'jjoinson11@amazon.de', 'nLgdXeJWWcG', '8052100837');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (38001, 'Selinda Bridge', 'Bridge', 'http://dummyimage.com/188x195.bmp/cc0000/ffffff', 'sbridge12@amazon.de', 'sbridge12@discovery.com', 'RE2IozGPeNx', '5506446005');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (39001, 'Hyacinthe Pestell', 'Pestell', 'http://dummyimage.com/189x195.png/dddddd/000000', 'hpestell13@elpais.com', 'hpestell13@mac.com', 'jSmDcVta50C4', '6494779231');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (40001, 'Merci Hugenin', 'Hugenin', 'http://dummyimage.com/148x125.png/ff4444/ffffff', 'mhugenin14@examiner.com', 'mhugenin14@about.com', 'QqehtepMs', '9085978696');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (41001, 'Mattie McConville', 'McConville', 'http://dummyimage.com/162x101.jpg/ff4444/ffffff', 'mmcconville15@reverbnation.com', 'mmcconville15@fda.gov', 'CcUxSZMHL', '4827931026');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (42001, 'Erroll Mafham', 'Mafham', 'http://dummyimage.com/109x153.bmp/cc0000/ffffff', 'emafham16@epa.gov', 'emafham16@cbc.ca', 'N6Oc9tK8f', '7505251867');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (43001, 'Dominick Ivimey', 'Ivimey', 'http://dummyimage.com/107x173.bmp/5fa2dd/ffffff', 'divimey17@wisc.edu', 'divimey17@hugedomains.com', 'TZb19ek', '3184124355');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (44001, 'Mela Kocher', 'Kocher', 'http://dummyimage.com/156x241.bmp/cc0000/ffffff', 'mkocher18@auda.org.au', 'mkocher18@omniture.com', 'Yg2eUFCtn', '9261107494');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (45001, 'Nikoletta Border', 'Border', 'http://dummyimage.com/155x133.bmp/ff4444/ffffff', 'nborder19@freewebs.com', 'nborder19@house.gov', 'jfRlS0v7tK', '4212084251');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (46001, 'Leann Pye', 'Pye', 'http://dummyimage.com/195x248.png/dddddd/000000', 'lpye1a@hibu.com', 'lpye1a@japanpost.jp', 'clb9QEkc', '7703614630');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (47001, 'Adara Brideaux', 'Brideaux', 'http://dummyimage.com/195x115.png/5fa2dd/ffffff', 'abrideaux1b@ask.com', 'abrideaux1b@mlb.com', '16cz7ynidw', '9322802838');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (48001, 'Zerk Rennick', 'Rennick', 'http://dummyimage.com/162x188.png/ff4444/ffffff', 'zrennick1c@xinhuanet.com', 'zrennick1c@cdc.gov', 'K8CwBrXKZ', '1974341522');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (49001, 'Terrance Sumpter', 'Sumpter', 'http://dummyimage.com/152x126.bmp/5fa2dd/ffffff', 'tsumpter1d@cam.ac.uk', 'tsumpter1d@yahoo.com', 'S2hhKKmh1', '1609647317');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (50001, 'Quentin Sphinxe', 'Sphinxe', 'http://dummyimage.com/110x173.bmp/ff4444/ffffff', 'qsphinxe1e@github.com', 'qsphinxe1e@pen.io', 'opplDsHCi', '6465228640');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (51001, 'Noni Richings', 'Richings', 'http://dummyimage.com/165x242.png/ff4444/ffffff', 'nrichings1f@kickstarter.com', 'nrichings1f@prlog.org', 'iMhiAGsN3', '3238544827');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (52001, 'Cort Boothby', 'Boothby', 'http://dummyimage.com/188x165.bmp/5fa2dd/ffffff', 'cboothby1g@ted.com', 'cboothby1g@is.gd', 'Mvw4cn', '7568376179');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (53001, 'Maryrose Cheatle', 'Cheatle', 'http://dummyimage.com/104x152.jpg/dddddd/000000', 'mcheatle1h@opera.com', 'mcheatle1h@answers.com', '5QSY7ot3', '6483282879');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (54001, 'Olenolin Borgne', 'Borgne', 'http://dummyimage.com/244x191.png/dddddd/000000', 'oborgne1i@odnoklassniki.ru', 'oborgne1i@java.com', 'RzW2TZ25GEh', '1171838210');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (55001, 'Filmer Laviss', 'Laviss', 'http://dummyimage.com/113x147.jpg/cc0000/ffffff', 'flaviss1j@elegantthemes.com', 'flaviss1j@barnesandnoble.com', 'J158DHXMFL', '6387813790');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (56001, 'Genia Anneslie', 'Anneslie', 'http://dummyimage.com/183x218.png/cc0000/ffffff', 'ganneslie1k@barnesandnoble.com', 'ganneslie1k@slate.com', 'nkm1Tn9MXJ', '7367106887');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (57001, 'Jorey Verillo', 'Verillo', 'http://dummyimage.com/233x163.bmp/dddddd/000000', 'jverillo1l@mashable.com', 'jverillo1l@senate.gov', 'jUUIxP', '5975678156');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (58001, 'Cara Haet', 'Haet', 'http://dummyimage.com/207x184.jpg/ff4444/ffffff', 'chaet1m@chronoengine.com', 'chaet1m@g.co', 'PR8d7Y8BP', '7841425648');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (59001, 'Alisander De Gogay', 'De Gogay', 'http://dummyimage.com/218x183.jpg/cc0000/ffffff', 'ade1n@devhub.com', 'ade1n@gizmodo.com', '7ska5A0847wG', '5454675707');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (60001, 'Darcie Poundsford', 'Poundsford', 'http://dummyimage.com/204x151.bmp/5fa2dd/ffffff', 'dpoundsford1o@un.org', 'dpoundsford1o@tmall.com', 'dYd1KmIEOpu9', '4379441803');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (61001, 'Brannon Niesegen', 'Niesegen', 'http://dummyimage.com/218x241.jpg/cc0000/ffffff', 'bniesegen1p@newyorker.com', 'bniesegen1p@ifeng.com', 'y4UNA0J7M', '1635930211');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (62001, 'Courtney Woodlands', 'Woodlands', 'http://dummyimage.com/232x182.jpg/dddddd/000000', 'cwoodlands1q@opera.com', 'cwoodlands1q@weebly.com', 'liGv1Wr7J7', '4691765382');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (63001, 'Archer Zarfai', 'Zarfai', 'http://dummyimage.com/191x112.bmp/ff4444/ffffff', 'azarfai1r@goodreads.com', 'azarfai1r@flickr.com', '2qltTVslvitG', '3616706813');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (64001, 'Federico Genny', 'Genny', 'http://dummyimage.com/247x191.bmp/ff4444/ffffff', 'fgenny1s@last.fm', 'fgenny1s@noaa.gov', '8tr1KHcCix50', '8357628140');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (65001, 'Teirtza Feldbaum', 'Feldbaum', 'http://dummyimage.com/224x111.jpg/ff4444/ffffff', 'tfeldbaum1t@tripadvisor.com', 'tfeldbaum1t@lycos.com', '7V3YW12Zidu', '5486095013');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (66001, 'Peta Itzik', 'Itzik', 'http://dummyimage.com/220x149.png/5fa2dd/ffffff', 'pitzik1u@webeden.co.uk', 'pitzik1u@sohu.com', 'XkFTEyc', '6555963868');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (67001, 'Felita Halpin', 'Halpin', 'http://dummyimage.com/182x144.jpg/cc0000/ffffff', 'fhalpin1v@ustream.tv', 'fhalpin1v@cloudflare.com', 'b70dLjCqK', '4812402092');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (68001, 'Bevon Vivian', 'Vivian', 'http://dummyimage.com/161x200.png/ff4444/ffffff', 'bvivian1w@sciencedirect.com', 'bvivian1w@unicef.org', 'OqlnwX8H', '8114619602');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (69001, 'Andy Aberdeen', 'Aberdeen', 'http://dummyimage.com/235x185.bmp/5fa2dd/ffffff', 'aaberdeen1x@fema.gov', 'aaberdeen1x@mapy.cz', 'uLGt7ph31KW', '7118167092');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (70001, 'Gonzales Eagell', 'Eagell', 'http://dummyimage.com/186x159.png/5fa2dd/ffffff', 'geagell1y@businessweek.com', 'geagell1y@thetimes.co.uk', 'HgWudhfxi0P', '1095401713');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (71001, 'Tamar Duffie', 'Duffie', 'http://dummyimage.com/135x156.bmp/ff4444/ffffff', 'tduffie1z@godaddy.com', 'tduffie1z@tripadvisor.com', 'SiuBNQ', '9608787242');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (72001, 'Ruben Ezzy', 'Ezzy', 'http://dummyimage.com/239x122.png/dddddd/000000', 'rezzy20@bloglovin.com', 'rezzy20@360.cn', 'Y0UXHDpaYjC', '9701757007');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (73001, 'Augustus Andreasson', 'Andreasson', 'http://dummyimage.com/182x169.png/dddddd/000000', 'aandreasson21@usda.gov', 'aandreasson21@intel.com', '4iGV9Z0z1KM', '1027041389');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (74001, 'Cairistiona Doud', 'Doud', 'http://dummyimage.com/123x102.bmp/ff4444/ffffff', 'cdoud22@prweb.com', 'cdoud22@hatena.ne.jp', 'BCAXIQvdR', '9593322444');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (75001, 'Hally Ramme', 'Ramme', 'http://dummyimage.com/147x131.bmp/ff4444/ffffff', 'hramme23@aol.com', 'hramme23@ucla.edu', 'P0i7zaLwRuMB', '4407997822');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (76001, 'Jonell Hubner', 'Hubner', 'http://dummyimage.com/222x118.bmp/cc0000/ffffff', 'jhubner24@smugmug.com', 'jhubner24@ifeng.com', 'Cd6sIO', '6747247844');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (77001, 'Atlante Chafer', 'Chafer', 'http://dummyimage.com/136x102.jpg/ff4444/ffffff', 'achafer25@bluehost.com', 'achafer25@barnesandnoble.com', 'fUphSGCzLkux', '1044292759');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (78001, 'Cale Gowthorpe', 'Gowthorpe', 'http://dummyimage.com/212x176.bmp/cc0000/ffffff', 'cgowthorpe26@goodreads.com', 'cgowthorpe26@state.gov', 'kijKbVMv', '8467512067');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (79001, 'Bone Randleson', 'Randleson', 'http://dummyimage.com/243x185.bmp/dddddd/000000', 'brandleson27@boston.com', 'brandleson27@jalbum.net', 'z2RHJoBSFEuS', '4117452210');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (80001, 'Linn Orwell', 'Orwell', 'http://dummyimage.com/102x187.bmp/ff4444/ffffff', 'lorwell28@slate.com', 'lorwell28@chron.com', 'toSQEtI', '9071661589');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (81001, 'Kelcy Yerbury', 'Yerbury', 'http://dummyimage.com/104x243.png/5fa2dd/ffffff', 'kyerbury29@oakley.com', 'kyerbury29@hibu.com', 'k7pZxe1up', '4854914720');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (82001, 'Ezequiel Breach', 'Breach', 'http://dummyimage.com/175x148.jpg/cc0000/ffffff', 'ebreach2a@joomla.org', 'ebreach2a@prnewswire.com', 'BnVW3T58J', '5437583703');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (83001, 'Vivien Rance', 'Rance', 'http://dummyimage.com/105x238.bmp/ff4444/ffffff', 'vrance2b@google.nl', 'vrance2b@archive.org', 'MC3CnRcWFeZ', '2271450541');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (84001, 'Russ Lennox', 'Lennox', 'http://dummyimage.com/171x100.jpg/cc0000/ffffff', 'rlennox2c@cnn.com', 'rlennox2c@sourceforge.net', 'hN1Xx4CqHzI', '5818615345');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (85001, 'Windham Anthoin', 'Anthoin', 'http://dummyimage.com/133x115.jpg/dddddd/000000', 'wanthoin2d@hugedomains.com', 'wanthoin2d@oaic.gov.au', 'L8Ng0quuMS5T', '2813411254');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (86001, 'Rocky McLauchlin', 'McLauchlin', 'http://dummyimage.com/101x157.bmp/cc0000/ffffff', 'rmclauchlin2e@upenn.edu', 'rmclauchlin2e@huffingtonpost.com', 'IGRIxj8D', '5191107472');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (87001, 'Tabbi Back', 'Back', 'http://dummyimage.com/180x226.png/cc0000/ffffff', 'tback2f@angelfire.com', 'tback2f@wired.com', 'MDGBtSz6dSZD', '5152379139');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (88001, 'Christiane Cattle', 'Cattle', 'http://dummyimage.com/171x160.bmp/ff4444/ffffff', 'ccattle2g@wikia.com', 'ccattle2g@paginegialle.it', 'VMgEIqRUD3', '5864373997');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (89001, 'Wallis Bernadzki', 'Bernadzki', 'http://dummyimage.com/102x171.bmp/ff4444/ffffff', 'wbernadzki2h@elegantthemes.com', 'wbernadzki2h@nyu.edu', 'x8lfEA', '3448990879');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (90001, 'Yoshiko Frantzen', 'Frantzen', 'http://dummyimage.com/188x168.jpg/ff4444/ffffff', 'yfrantzen2i@alibaba.com', 'yfrantzen2i@wisc.edu', 'bYMHmif', '4524695669');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (91001, 'Cassondra Shead', 'Shead', 'http://dummyimage.com/158x186.png/cc0000/ffffff', 'cshead2j@google.com.au', 'cshead2j@csmonitor.com', 'IS3DSusA3K', '4576702746');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (92001, 'Marlee Rickert', 'Rickert', 'http://dummyimage.com/197x149.bmp/5fa2dd/ffffff', 'mrickert2k@yellowbook.com', 'mrickert2k@jalbum.net', '9zXlVIVf', '1173311227');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (93001, 'Ezequiel Maunton', 'Maunton', 'http://dummyimage.com/219x103.png/dddddd/000000', 'emaunton2l@stanford.edu', 'emaunton2l@howstuffworks.com', 'KXSzHA', '1203680323');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (94001, 'Jonathan Maccree', 'Maccree', 'http://dummyimage.com/116x205.png/dddddd/000000', 'jmaccree2m@nationalgeographic.com', 'jmaccree2m@mozilla.com', 'TwbcnvJ', '3594442034');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (95001, 'Mariette Bew', 'Bew', 'http://dummyimage.com/150x170.jpg/5fa2dd/ffffff', 'mbew2n@usatoday.com', 'mbew2n@icq.com', 'uFPNyD', '9964187475');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (96001, 'Ryan Allcroft', 'Allcroft', 'http://dummyimage.com/174x181.bmp/dddddd/000000', 'rallcroft2o@dot.gov', 'rallcroft2o@pbs.org', 'qG2mNw26', '5685536493');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (97001, 'Corly Nurdin', 'Nurdin', 'http://dummyimage.com/234x141.png/cc0000/ffffff', 'cnurdin2p@51.la', 'cnurdin2p@webs.com', 'NZ0yfssrRsx', '8243675296');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (98001, 'Dee dee Hollyland', 'Hollyland', 'http://dummyimage.com/122x197.bmp/dddddd/000000', 'ddee2q@foxnews.com', 'ddee2q@freewebs.com', 'UZLFg07e3DJ', '6561423509');
insert into users (Id, name_user, last_name, photo, email_address, email_address2, password_user, cellphone_number) values (99001, 'Tawnya Agneau', 'Agneau', 'http://dummyimage.com/143x202.png/5fa2dd/ffffff', 'tagneau2r@nymag.com', 'tagneau2r@wikispaces.com', 'DLxv4l5go7', '9056994474');

insert into promotions (Id, code_promotion) values (1, 1);
insert into promotions (Id, code_promotion) values (1001, 2);
insert into promotions (Id, code_promotion) values (2001, 3);

insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (1, 'Tamiko Loveredge', 'Loveredge', 'tloveredge0@multiply.com', 'tloveredge0@dyndns.org', 'nM2tSqGwa', '1731172705', 1, '1037798242');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (1001, 'Rouvin Labet', 'Labet', 'rlabet1@geocities.com', 'rlabet1@cloudflare.com', 'aCVr1aISSU7d', '5996810310', 2, '8651307073');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (2001, 'Carmine Yendle', 'Yendle', 'cyendle2@merriam-webster.com', 'cyendle2@nature.com', 'byScOLy', '8582185206', 3, '6317653731');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (3001, 'Traver Hurch', 'Hurch', 'thurch3@ameblo.jp', 'thurch3@cbslocal.com', '0Jh17j', '6429609646', 4, '3771706072');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (4001, 'Stu Billany', 'Billany', 'sbillany4@noaa.gov', 'sbillany4@salon.com', 'DSCfwl', '7099024837', 5, '4473171707');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (5001, 'Jeana Mac Giany', 'Mac Giany', 'jmac5@dmoz.org', 'jmac5@flavors.me', '2294JKubJtbg', '7821078049', 6, '3256989803');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (6001, 'Trenton Harkins', 'Harkins', 'tharkins6@ca.gov', 'tharkins6@clickbank.net', 'wWW7Cd8w2w', '2541706756', 7, '9719373555');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (7001, 'Lucien Soar', 'Soar', 'lsoar7@sina.com.cn', 'lsoar7@omniture.com', 't8pQmFES', '5589650105', 8, '6778661131');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (8001, 'Clo Cockett', 'Cockett', 'ccockett8@over-blog.com', 'ccockett8@skyrock.com', 'F6GuW47h', '2576614060', 9, '9902938428');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (9001, 'Gerladina Kinnie', 'Kinnie', 'gkinnie9@usa.gov', 'gkinnie9@marketwatch.com', '2Bu33SS91JFR', '8369085817', 10, '2159788262');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (10001, 'Emelda Massingham', 'Massingham', 'emassinghama@bluehost.com', 'emassinghama@forbes.com', 'Dd96DCl', '8899862487', 11, '5031986712');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (11001, 'Leoine Ruprecht', 'Ruprecht', 'lruprechtb@marketwatch.com', 'lruprechtb@yelp.com', '14UTx81', '9722149268', 12, '4151716044');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (12001, 'Constantine Wrinch', 'Wrinch', 'cwrinchc@ihg.com', 'cwrinchc@hexun.com', '7tnhLzt', '1895810972', 13, '1697354926');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (13001, 'Biron Pinnegar', 'Pinnegar', 'bpinnegard@plala.or.jp', 'bpinnegard@themeforest.net', 'jbm0BcqQNT9N', '8481051657', 14, '7051049187');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (14001, 'Dulcine Clague', 'Clague', 'dclaguee@berkeley.edu', 'dclaguee@skyrock.com', 'cnX66UAoSd', '8845619404', 15, '3519714898');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (15001, 'Gwen Crunkhorn', 'Crunkhorn', 'gcrunkhornf@narod.ru', 'gcrunkhornf@studiopress.com', 'JpVqhz5', '4538442689', 16, '9441203991');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (16001, 'Horace McLellan', 'McLellan', 'hmclellang@prweb.com', 'hmclellang@phpbb.com', 'LmBcehWF', '5371722989', 17, '9191570099');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (17001, 'Calla Konig', 'Konig', 'ckonigh@mit.edu', 'ckonigh@nasa.gov', 'tOoHTvTzxyH9', '2935428489', 18, '6702950885');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (18001, 'Charity Nijs', 'Nijs', 'cnijsi@topsy.com', 'cnijsi@clickbank.net', 'bQvGlM', '4346099916', 19, '2926177115');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (19001, 'Benedicto Glenny', 'Glenny', 'bglennyj@google.com.hk', 'bglennyj@gmpg.org', 'lIciNMrxxM', '9407849709', 20, '3182614272');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (20001, 'Tomi Cubbinelli', 'Cubbinelli', 'tcubbinellik@va.gov', 'tcubbinellik@ucsd.edu', '4dO37o6k2OGd', '8417986044', 21, '5565259979');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (21001, 'Kelsy Charnley', 'Charnley', 'kcharnleyl@google.ca', 'kcharnleyl@cdbaby.com', 'ucOX5POyf', '4673593856', 22, '9978733861');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (22001, 'Corrinne Somerville', 'Somerville', 'csomervillem@archive.org', 'csomervillem@npr.org', 'oZGen6t', '9536336597', 23, '5131011554');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (23001, 'Steffie Wheelwright', 'Wheelwright', 'swheelwrightn@fema.gov', 'swheelwrightn@feedburner.com', 'VI0cLK', '3332583260', 24, '3698768009');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (24001, 'Timi Kleuer', 'Kleuer', 'tkleuero@imgur.com', 'tkleuero@vistaprint.com', 'zYEkWs4DGjv9', '1945806672', 25, '5083636112');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (25001, 'Mano Cast', 'Cast', 'mcastp@geocities.jp', 'mcastp@deliciousdays.com', 'b1KGz4VL', '7547802687', 26, '7934175928');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (26001, 'Joscelin Pingstone', 'Pingstone', 'jpingstoneq@xinhuanet.com', 'jpingstoneq@disqus.com', '0onALGti', '5864766954', 27, '2409827650');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (27001, 'Brander Teml', 'Teml', 'btemlr@creativecommons.org', 'btemlr@t-online.de', '4KeXHQA', '5063007850', 28, '9828133867');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (28001, 'Laverne Meadmore', 'Meadmore', 'lmeadmores@icq.com', 'lmeadmores@meetup.com', 'hLDCVj1lsj', '2798985235', 29, '5398808379');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (29001, 'Murial Clingoe', 'Clingoe', 'mclingoet@sakura.ne.jp', 'mclingoet@themeforest.net', 'KYtbVZn6Xa91', '9099443653', 30, '9955180848');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (30001, 'Raymund Dressell', 'Dressell', 'rdressellu@wix.com', 'rdressellu@about.com', 'KiZGkxizLnY3', '9054196104', 31, '9741480759');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (31001, 'Sammie Ponten', 'Ponten', 'spontenv@google.pl', 'spontenv@spotify.com', 'tMUnkv5', '4674201519', 32, '4696276931');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (32001, 'Minna Leckey', 'Leckey', 'mleckeyw@adobe.com', 'mleckeyw@usda.gov', '3zTRsMs', '3032363304', 33, '4723709789');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (33001, 'Aylmer Cadamy', 'Cadamy', 'acadamyx@myspace.com', 'acadamyx@eventbrite.com', 'XRjDQwJ0QFwz', '9127719607', 34, '4713942613');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (34001, 'Erma Whitlam', 'Whitlam', 'ewhitlamy@aboutads.info', 'ewhitlamy@ehow.com', 'mEVHI6SED', '6644831217', 35, '1072376313');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (35001, 'Fredelia Gedge', 'Gedge', 'fgedgez@nba.com', 'fgedgez@deviantart.com', 'J8kUkTa', '9962960680', 36, '2756386422');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (36001, 'Drusy Nellis', 'Nellis', 'dnellis10@msn.com', 'dnellis10@sciencedaily.com', 'adeNxPCv2N', '7115759030', 37, '5332110230');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (37001, 'Cynthea Foard', 'Foard', 'cfoard11@cmu.edu', 'cfoard11@webmd.com', 'Sx9g7U', '5848395491', 38, '7778037518');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (38001, 'Emilio Bonnier', 'Bonnier', 'ebonnier12@cloudflare.com', 'ebonnier12@cnn.com', 'vof2QS', '2743149524', 39, '9211810794');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (39001, 'Rosalyn Verdey', 'Verdey', 'rverdey13@over-blog.com', 'rverdey13@imageshack.us', 'rDxr2HFnD', '7262666672', 40, '4724740160');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (40001, 'Walton Proffer', 'Proffer', 'wproffer14@vimeo.com', 'wproffer14@illinois.edu', 'bWMkYs', '7129357374', 41, '1367087619');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (41001, 'Benn Salvatore', 'Salvatore', 'bsalvatore15@digg.com', 'bsalvatore15@free.fr', 'YnGyFLhv', '7375193989', 42, '9091695732');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (42001, 'Alia Bucktrout', 'Bucktrout', 'abucktrout16@t.co', 'abucktrout16@slideshare.net', 'EMphmG1wu', '8204819008', 43, '8901895166');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (43001, 'Christoffer Seers', 'Seers', 'cseers17@ovh.net', 'cseers17@g.co', 'BQOoRKUV3', '4226469101', 44, '7819589150');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (44001, 'Flin Catlin', 'Catlin', 'fcatlin18@yale.edu', 'fcatlin18@loc.gov', '3OOQUc', '3204015338', 45, '4946095952');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (45001, 'Murry Gleave', 'Gleave', 'mgleave19@indiatimes.com', 'mgleave19@webmd.com', 'owRUlVTF', '1172112911', 46, '8101884257');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (46001, 'Phip Macauley', 'Macauley', 'pmacauley1a@hostgator.com', 'pmacauley1a@slideshare.net', '9sO5NSHs', '2011271564', 47, '3967627491');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (47001, 'Gib Killingworth', 'Killingworth', 'gkillingworth1b@ning.com', 'gkillingworth1b@dropbox.com', 'DYm1VTVwVrg', '6564129358', 48, '9562397511');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (48001, 'Olly Kinnear', 'Kinnear', 'okinnear1c@ftc.gov', 'okinnear1c@state.gov', 'M5VHBEygO5r', '6274561981', 49, '9239187361');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (49001, 'Kameko Crenshaw', 'Crenshaw', 'kcrenshaw1d@loc.gov', 'kcrenshaw1d@nhs.uk', 'eDeuhFpWVVtP', '7028125909', 50, '9435607042');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (50001, 'Emmalynn Holton', 'Holton', 'eholton1e@deliciousdays.com', 'eholton1e@last.fm', 'qYJm6LXmKZyz', '9132712556', 51, '1511308723');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (51001, 'Daryle Bigland', 'Bigland', 'dbigland1f@auda.org.au', 'dbigland1f@parallels.com', 'ufpYLf02p', '4109858332', 52, '4536654277');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (52001, 'Allie MacIllrick', 'MacIllrick', 'amacillrick1g@so-net.ne.jp', 'amacillrick1g@biglobe.ne.jp', 'WH2Cdp', '5769817552', 53, '9767547836');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (53001, 'Ofelia Harkus', 'Harkus', 'oharkus1h@indiatimes.com', 'oharkus1h@live.com', '26BUIa4', '5232457698', 54, '5935494025');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (54001, 'Reeva Bagnold', 'Bagnold', 'rbagnold1i@mediafire.com', 'rbagnold1i@kickstarter.com', 'ceeMYl', '3539702216', 55, '6076258776');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (55001, 'Terza Cowhig', 'Cowhig', 'tcowhig1j@storify.com', 'tcowhig1j@cmu.edu', 'SmKsqU1IgeJ', '4096223519', 56, '5541391351');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (56001, 'Mariya Noblett', 'Noblett', 'mnoblett1k@google.ru', 'mnoblett1k@flickr.com', 'x1caraL', '4037463880', 57, '3095598885');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (57001, 'Tedra Downe', 'Downe', 'tdowne1l@ed.gov', 'tdowne1l@xing.com', 'ozSdlzLxeR', '3258524463', 58, '9868764900');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (58001, 'Maggee Gittis', 'Gittis', 'mgittis1m@wordpress.org', 'mgittis1m@booking.com', 'MYr2nEL9W5', '1897087708', 59, '1182781722');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (59001, 'Lian Antonik', 'Antonik', 'lantonik1n@deliciousdays.com', 'lantonik1n@nymag.com', 'jJvLCdqG0', '9694427407', 60, '5133957310');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (60001, 'Charmian Whitfield', 'Whitfield', 'cwhitfield1o@businessinsider.com', 'cwhitfield1o@wp.com', 'CZiijziIf', '3855372424', 61, '8157950727');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (61001, 'Sisely Jayne', 'Jayne', 'sjayne1p@geocities.com', 'sjayne1p@marriott.com', 'uydZpD9', '5469759860', 62, '4434862482');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (62001, 'Anet Stode', 'Stode', 'astode1q@engadget.com', 'astode1q@phoca.cz', 'ClfXlUUUHduP', '3209976792', 63, '6159934855');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (63001, 'Chad Macon', 'Macon', 'cmacon1r@google.cn', 'cmacon1r@uol.com.br', 'NUg7CS2', '9066278674', 64, '3037571851');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (64001, 'Eberto Waiting', 'Waiting', 'ewaiting1s@cisco.com', 'ewaiting1s@de.vu', 'V4hTC9K', '3025382630', 65, '6011389111');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (65001, 'Vyky Sabin', 'Sabin', 'vsabin1t@huffingtonpost.com', 'vsabin1t@hp.com', 'iZi2ywFgGb', '7397882755', 66, '2051405763');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (66001, 'Minetta Bollard', 'Bollard', 'mbollard1u@archive.org', 'mbollard1u@live.com', 'qRgnrJ', '2062253880', 67, '8522296393');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (67001, 'Pebrook Camili', 'Camili', 'pcamili1v@state.gov', 'pcamili1v@unblog.fr', 'gpjR3V6En', '9621808227', 68, '2793584207');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (68001, 'Nil Scoon', 'Scoon', 'nscoon1w@tmall.com', 'nscoon1w@dropbox.com', 'x4OCNk', '6492979393', 69, '4308657362');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (69001, 'Yetty Cuardall', 'Cuardall', 'ycuardall1x@hugedomains.com', 'ycuardall1x@instagram.com', 'jpIYND', '6127637762', 70, '1731522527');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (70001, 'Jarrid Trevor', 'Trevor', 'jtrevor1y@vistaprint.com', 'jtrevor1y@purevolume.com', 'Qa1Hnsik0R', '3748609947', 71, '9444861557');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (71001, 'Dian Labrone', 'Labrone', 'dlabrone1z@ameblo.jp', 'dlabrone1z@businessinsider.com', 'hXsxr3Zjz', '9476464775', 72, '2089485581');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (72001, 'Daffi Telezhkin', 'Telezhkin', 'dtelezhkin20@ox.ac.uk', 'dtelezhkin20@indiegogo.com', 'eobmSYZDWZNZ', '4077945507', 73, '5274458052');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (73001, 'Jsandye Boman', 'Boman', 'jboman21@dot.gov', 'jboman21@microsoft.com', 'LWgIzpsJW89H', '4786255815', 74, '5355156810');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (74001, 'Oby Ivimy', 'Ivimy', 'oivimy22@psu.edu', 'oivimy22@hubpages.com', 'bBxs28b', '4227564527', 75, '2185088738');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (75001, 'Benny Benyon', 'Benyon', 'bbenyon23@github.io', 'bbenyon23@mtv.com', 'k4j9TPcD2', '6997591121', 76, '3169935846');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (76001, 'Mil Ferro', 'Ferro', 'mferro24@eepurl.com', 'mferro24@vinaora.com', 'WBVAc7w', '1858986084', 77, '4739015019');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (77001, 'Hughie MacWhan', 'MacWhan', 'hmacwhan25@huffingtonpost.com', 'hmacwhan25@over-blog.com', 'bodZC47Vhi', '9835192906', 78, '2123058381');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (78001, 'Cecil Kempton', 'Kempton', 'ckempton26@histats.com', 'ckempton26@wikia.com', '46CFfjSwjeJ', '7915909664', 79, '5021103003');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (79001, 'Spenser Gallager', 'Gallager', 'sgallager27@engadget.com', 'sgallager27@msu.edu', 'XjDWinsPF', '6765460088', 80, '3109641421');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (80001, 'Fritz Ruggen', 'Ruggen', 'fruggen28@wired.com', 'fruggen28@nsw.gov.au', 'PpBQzbt6', '7944100523', 81, '9206297922');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (81001, 'Darwin Geldard', 'Geldard', 'dgeldard29@ow.ly', 'dgeldard29@time.com', 'mb1XhsQiw0', '8144944123', 82, '8319350857');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (82001, 'Reynolds Railton', 'Railton', 'rrailton2a@jimdo.com', 'rrailton2a@g.co', 'wtA2yeHJlWp', '9554898590', 83, '1353481991');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (83001, 'Gabriel Holberry', 'Holberry', 'gholberry2b@nih.gov', 'gholberry2b@hostgator.com', 'ImVjaFeKKyW5', '2387288369', 84, '2761295786');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (84001, 'Randi Humble', 'Humble', 'rhumble2c@indiatimes.com', 'rhumble2c@bing.com', 'i540YiF9Mj', '7557265649', 85, '6834926733');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (85001, 'Hugibert Melliard', 'Melliard', 'hmelliard2d@whitehouse.gov', 'hmelliard2d@csmonitor.com', 'fS9jwJUp', '7019090664', 86, '8924758634');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (86001, 'Charity Bottinelli', 'Bottinelli', 'cbottinelli2e@bigcartel.com', 'cbottinelli2e@bluehost.com', 'TaB5Oyblv', '9235195038', 87, '9518275464');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (87001, 'Cristy Kroll', 'Kroll', 'ckroll2f@uol.com.br', 'ckroll2f@usatoday.com', '6qL2MDyb9wSb', '3621105974', 88, '2326387892');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (88001, 'Thomas Rate', 'Rate', 'trate2g@woothemes.com', 'trate2g@youku.com', 'l4kxgNWHwf', '3141546533', 89, '8349118848');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (89001, 'Jon Goseling', 'Goseling', 'jgoseling2h@vkontakte.ru', 'jgoseling2h@163.com', 'MEXqu9n6fq', '4897810054', 90, '2107967451');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (90001, 'Tabitha Ramet', 'Ramet', 'tramet2i@usatoday.com', 'tramet2i@a8.net', 'd060ARxlalAu', '8688940780', 91, '4632752161');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (91001, 'Muhammad Sweetzer', 'Sweetzer', 'msweetzer2j@nature.com', 'msweetzer2j@pcworld.com', 'uJ52dYLRSmN', '8403647787', 92, '6681319260');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (92001, 'Gale Truse', 'Truse', 'gtruse2k@ycombinator.com', 'gtruse2k@marriott.com', 'IXGvOBin', '1247092535', 93, '9793175854');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (93001, 'Buckie Weldrake', 'Weldrake', 'bweldrake2l@whitehouse.gov', 'bweldrake2l@facebook.com', 'R8fteOD4sK', '9936471906', 94, '2463839133');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (94001, 'Quinton Henbury', 'Henbury', 'qhenbury2m@list-manage.com', 'qhenbury2m@163.com', 'SqO3cmk6ypA7', '8108290149', 95, '5134285849');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (95001, 'Julia Dysert', 'Dysert', 'jdysert2n@biblegateway.com', 'jdysert2n@tamu.edu', 'gnFAJuuVplLZ', '6798586425', 96, '2987699882');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (96001, 'Ronica Sheldrake', 'Sheldrake', 'rsheldrake2o@telegraph.co.uk', 'rsheldrake2o@pagesperso-orange.fr', 'PF2PMq2', '2436206504', 97, '5333121189');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (97001, 'Tressa Braizier', 'Braizier', 'tbraizier2p@freewebs.com', 'tbraizier2p@behance.net', 'VxNwHXF', '9658814912', 98, '1246816494');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (98001, 'Mace Pittendreigh', 'Pittendreigh', 'mpittendreigh2q@google.com.au', 'mpittendreigh2q@deviantart.com', 'RxdnYA', '1235379452', 99, '7754251359');
insert into drivers (Id, name, last_name, email_address, email_address2, password, cellphone_number, invite_code, bank_account_number) values (99001, 'Corrianne Danforth', 'Danforth', 'cdanforth2r@so-net.ne.jp', 'cdanforth2r@mapy.cz', 'qlxgmr', '2815213158', 100, '7189997087');

insert into trips (Id, date_trips, origin_address, destination_address, distance) values (1, '26/05/2018', '3942 South Circle', '2 8th Crossing', 'racreman0@cornell.edu');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (1001, '26/01/2018', '57 Prairie Rose Plaza', '7 Maple Wood Court', 'awannes1@smh.com.au');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (2001, '31/12/2017', '40512 Columbus Place', '80 Oak Alley', 'lpetzold2@google.es');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (3001, '19/08/2018', '373 Eagan Trail', '7 Fuller Pass', 'sbatt3@addtoany.com');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (4001, '01/02/2018', '51 Buena Vista Circle', '670 Golf Course Park', 'rpetrillo4@free.fr');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (5001, '25/04/2018', '4115 Weeping Birch Street', '50452 Loomis Hill', 'mrangall5@imgur.com');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (6001, '09/07/2018', '5 Northview Street', '372 Onsgard Lane', 'lmayfield6@amazon.com');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (7001, '10/07/2018', '210 Colorado Park', '197 Dovetail Trail', 'bvanlint7@wired.com');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (8001, '29/10/2018', '14 Ohio Lane', '0719 Sunfield Road', 'zstobbart8@parallels.com');
insert into trips (Id, date_trips, origin_address, destination_address, distance) values (9001, '07/01/2018', '4 Emmet Trail', '0700 Springview Alley', 'pcodrington9@yellowpages.com');

insert into currency (Id, name) values (1, 'Yuan Renminbi');
insert into currency (Id, name) values (1001, 'Euro');
insert into currency (Id, name) values (2001, 'Zloty');
insert into currency (Id, name) values (3001, 'Yuan Renminbi');
insert into currency (Id, name) values (4001, 'Yuan Renminbi');

insert into countrys (Id, country, currency) values (1, 'Saint Kitts and Nevis', 'Dollar');
insert into countrys (Id, country, currency) values (1001, 'China', 'Yuan Renminbi');
insert into countrys (Id, country, currency) values (2001, 'Colombia', 'Peso');
insert into countrys (Id, country, currency) values (3001, 'Russia', 'Ruble');
insert into countrys (Id, country, currency) values (4001, 'Indonesia', 'Rupiah');

insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (1, 1, 51467, 1, 37036);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (1001, 2, 78850, 2, 33898);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (2001, 3, 96151, 3, 75960);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (3001, 4, 30223, 4, 75662);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (4001, 5, 26856, 5, 27338);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (5001, 6, 79127, 6, 84160);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (6001, 7, 61658, 7, 40122);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (7001, 8, 20903, 8, 21590);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (8001, 9, 41510, 9, 26808);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (9001, 10, 82254, 10, 75919);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (10001, 11, 75603, 11, 54929);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (11001, 12, 26070, 12, 9696);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (12001, 13, 71274, 13, 72714);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (13001, 14, 72793, 14, 94874);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (14001, 15, 25245, 15, 35319);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (15001, 16, 74314, 16, 71250);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (16001, 17, 92281, 17, 80170);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (17001, 18, 88710, 18, 22972);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (18001, 19, 11095, 19, 50606);
insert into trip_user_bills (Id, trip_user_id, subtotal, user_promotion_code_id, total) values (19001, 20, 17801, 20, 44549);

