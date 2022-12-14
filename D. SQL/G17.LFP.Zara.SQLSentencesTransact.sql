CREATE TABLE WEB(
URL nvarchar NOT NULL,
NAME nvarchar NOT NULL,
constraint UQ_WEB_NAME unique (name),
CONSTRAINT PK_WEB_URL PRIMARY KEY(URL)
);
CREATE TABLE HEADQUARTERS( 
COUNTRY nvarchar(50) NOT NULL, 
NUMEMPLOYEES NUMERIC(18,0) DEFAULT (2),
NUMSTORES NUMERIC(18,0),
ADDRESSSTREET varchar(50) ,
ADDRESSNUM varchar(7),
ADDRESSFLOOR varchar(4),
ACCOUNTNUMBER varchar(24) ,
NAMEDIRECTOR varchar (50),
DIRECTORID NUMERIC(18,0) not null,
CONSTRAINT CQ_CHECK_HEAD CHECK (NUMSTORES>0),
CONSTRAINT PK_HEADQUARTERS_COUNTRY PRIMARY KEY (COUNTRY)
);


CREATE TABLE WAREHOUSES( 
WAREHOUSEID numeric(18,0) NOT NULL, 
ADDRESS varchar(50),
NUMWAITERSWA numeric(18,0) DEFAULT (2),
NUMEMPLOYEES numeric(18,0),
CONSTRAINT UQ_WAREHOUSES_ADDRESS unique (ADDRESS),
CONSTRAINT PK_WAREHOUSES_WAREHOUSEID PRIMARY KEY(WAREHOUSEID)
);


CREATE TABLE CUSTOMERS(
CUSTOMERID int NOT NULL,
NAME nvarchar NOT NULL,
FIRSTNAME nvarchar,
SECONDNAME nvarchar,
CONSTRAINT PK_CUSTOMERS_CUSTOMERID PRIMARY KEY(CUSTOMERID)
) ;

CREATE TABLE PHYSICALS(
CUSTOMERID int NOT NULL,
PHYSICALID int NOT NULL,
TICKETID int,
CONSTRAINT UQ_PHYSICALS_TICKETID unique (TICKETID), 
CONSTRAINT CQ_CHECK_CUS CHECK (CUSTOMERID>0),
CONSTRAINT FK_PHYSICALS_CUSTOMERID foreign key (CUSTOMERID) REFERENCES CUSTOMERS (CUSTOMERID),
CONSTRAINT PK_PHYSICALS_CUSTOMERID PRIMARY KEY(CUSTOMERID)
);

CREATE TABLE EMPLOYEES(
EMPLOYEEID numeric(18,0) NOT NULL,
DNI char(9) null,
EMAIL varchar(50) null,
ADDREESSSTRET varchar(50),
ADRESSNUM varchar(7),
ADRESSFLOOR varchar(4),
ACOUNTNUMBER varchar(24),
BIRTHDAY date not null,
AGE numeric(3),
NAME varchar(20) not null,
FIRSTNAME varchar(20),
SECONDNAME varchar(20),
constraint UQ_EMPLOYEES_EMAIL unique(EMAIL),
constraint UQ_EMPLYEES_DNI unique (DNI),
constraint PK_EMPLOYEES_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)
) ;

CREATE TABLE COMPUTERENGENIEER ( 
EMPLOYEEID numeric(18,0) not null,
COMPUTERENID numeric(18,0) NOT NULL, 
CONSTRAINT FK_COMPUNEER_EMPLOYEESID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID), 	
CONSTRAINT PK_COMPUTEER_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)
) ;

CREATE TABLE EMPLOYEESEMAIL(
EMPLOYEEID numeric(18,0) not null,
EMAILS nvarchar,
CONSTRAINT CQ_CHECK_EMP CHECK (EMAILS>0),
CONSTRAINT FK_EMPLOYEES_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_EMPLOYEESEMAIL_EMP_EMAIL PRIMARY KEY (EMPLOYEEID,EMAILS)
);

CREATE TABLE SELLERS(
EMPLOYEEID numeric(18,0) NOT NULL,
SELLERSID int NOT NULL,
SHOPID int NOT NULL,
CONSTRAINT CQ_CHECK_SELER CHECK (SHOPID>0),
CONSTRAINT FK_SELLERS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_SELLERS_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)
) ;
CREATE TABLE CARRIERS (
EMPLOYEEID numeric(18,0) NOT NULL, 
CARRIERSID numeric(18,0) NOT NULL,
PHONE numeric(18,0) NOT NULL,
constraint UQ_CARRIERS_PHONE unique (PHONE),
CONSTRAINT FK_CARRIERS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_CARRIERS_EMPLOYEEID PRIMARY KEY(EMPLOYEEID),
) ;
CREATE TABLE SALARIES( 
QUANTITY Numeric(18,0) DEFAULT(0),
EMPLOYEEID Numeric(18,0),
EXTRAPAYMENTS Numeric(18,0) DEFAULT(0),
CONSTRAINT FK_SALARY_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES (EMPLOYEEID),
CONSTRAINT PK_SALARIES_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)

);
CREATE TABLE CLAIMS( 
CLAIMCODE numeric(18,0) NOT NULL, 
CUSTOMERID int NOT NULL,
DAT numeric (18,0) NOT NULL, 
EMPLOYEEATTENDS numeric (18,0),
NAMES nvarchar(50),
DESCRIPT nvarchar(50),
CONSTRAINT CQ_CHECK_CLAIMS CHECK (CLAIMCODE>0),
CONSTRAINT FK_CLAIMS_CUSTOMERID foreign key (CUSTOMERID) references CUSTOMERS (CUSTOMERID),
CONSTRAINT PK_CLAIMS_CUSTOMERID PRIMARY KEY(CUSTOMERID)
);
CREATE TABLE WAITERSWAREHOUSES ( 
EMPLOYEEID numeric(18,0) not null,
WAITERSID numeric(18,0) NOT NULL, 
BEEPER numeric(18,0)DEFAULT(0),
CONSTRAINT CQ_CHECK_WAITERS CHECK (WAITERSID>0),
CONSTRAINT FK_WAITERS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_WAITERS_EMPLOYEEID PRIMARY KEY (EMPLOYEEID)
) ;
CREATE TABLE MANAGERS ( 
EMPLOYEEID numeric(18,0) not null,
MANAGERID numeric(18,0) NOT NULL, 
CONSTRAINT CQ_CHECK_MANAGER CHECK (MANAGERID>0),
CONSTRAINT FK_MANAGERS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_MANAGERS_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)

);

CREATE TABLE MANAGERSSTUDIES(
EMPLOYEEID numeric(18,0) not null, 
QUALIFICATION numeric(3) not null,
CONSTRAINT FK_MANAGERS_MANAGERID foreign key (EMPLOYEEID) references MANAGERS (EMPLOYEEID),
CONSTRAINT PK_MANAGERSSTUDIES_MAN_STU PRIMARY KEY (EMPLOYEEID, QUALIFICATION)
);
CREATE TABLE DIRECTORS ( 
EMPLOYEEID NUMERIC(18,0) not null,
DIRECTORID NUMERIC(18,0) NOT NULL, 
COMPANYID int NOT NULL,
CONSTRAINT CQ_CHECK_DIREC CHECK (DIRECTORID>0),
CONSTRAINT FK_DIRECTORS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_DIRECTORS_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)
) ;



CREATE TABLE DIRECTORSSTUDIES(
EMPLOYEEID NUMERIC(18,0) Not null, 
QUALIFICATION NUMERIC(18,0) NOT NULL,
CONSTRAINT FK_DIRECTSTUDIES_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES (EMPLOYEEID),
CONSTRAINT PK_DIRECTORSSTUDIES_DIR_STU PRIMARY KEY (EMPLOYEEID, QUALIFICATION)
);
CREATE TABLE ADMINISTRATIVES ( 
EMPLOYEEID numeric(18,0) not null,
ADMINISTRATIVESID numeric(18,0) NOT NULL, 
LICENSE numeric (20) NOT NULL,
CONSTRAINT CQ_CHECK_ADMINI CHECK (ADMINISTRATIVESID>0),
CONSTRAINT FK_ADMINISTRATIVES_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT PK_ADMINISTRATIVES_EMPLOYEEID PRIMARY KEY (EMPLOYEEID)
) ;

CREATE TABLE CYBERS( 
CUSTOMERID int NOT NULL,
CYBERID numeric(18,0) NOT NULL,
URL  nvarchar(1) NOT NULL,
ADDRESSSTREET nvarchar(50),
ADDRESSNUM nvarchar(7),
ADDRESSFLOOR nvarchar(4),
ACCOUNTNUMBER nvarchar(24) DEFAULT (0),
CONSTRAINT CQ_CHECK_CYBER CHECK (CYBERID>0),
CONSTRAINT FK_CYBERS_CUSTOMERID foreign key (CUSTOMERID) references CUSTOMERS (CUSTOMERID),
CONSTRAINT FK_CYBERS_URL foreign key (URL) references WEB (URL),
constraint PK_CYBERS_CUSTOMERID PRIMARY KEY (CUSTOMERID),
);
CREATE TABLE STORES( 
STOREID numeric(18,0) NOT NULL, 
CUSTOMERID int NOT NULL,
COUNTRY nvarchar(50) NOT NULL, 
ADDRESS nvarchar(50),
NUMDEPARTMNETS numeric(18,0) DEFAULT(3),
NUMEMPLOYEES numeric(18,0) DEFAULT(2),
CONSTRAINT FK_STORES_CUSTOMERID foreign key (CUSTOMERID) references CUSTOMERS (CUSTOMERID),
CONSTRAINT FK_STORES_COUNTRY foreign key (COUNTRY) references HEADQUARTERS (COUNTRY),
CONSTRAINT UQ_STORES_ADDRESS unique (ADDRESS),
CONSTRAINT PK_STORES_STOREID PRIMARY KEY (STOREID)
);
CREATE TABLE STORETLPNUMBERS(
STOREID numeric(18,0) not null, 
TLPNUMBER numeric(18,0),
CONSTRAINT FK_STORETLPNUMBERS_STOREID foreign key (STOREID) references STORES(STOREID),
CONSTRAINT PK_STORETLPNUMBERS_STO_TLPN PRIMARY KEY (STOREID,TLPNUMBER)
);

CREATE TABLE DEPARTMENTS( 
DEPARTMENTID numeric(18,0) NOT NULL, 
STOREID numeric(18,0) NOT NULL, 
NUMDEPRODUCTS numeric(18,0),
NUMEMPLOYEES numeric(18,0),
CONSTRAINT FK_DEPARTMENTS_STOREID foreign key (STOREID) references STORES (STOREID),
CONSTRAINT PK_DEPARTMETNS_DEPARTMENTID PRIMARY KEY (DEPARTMENTID)

);
CREATE TABLE PRODUCTS( 
PRODUCTID NUMERIC(18,0) NOT NULL, 
SELLERSID NUMERIC(18,0) NOT NULL,
DEPARTMENTID NUMERIC(18,0) NOT NULL,
MODEL NUMERIC(15),
COLOUR varchar(10),
CONSTRAINT FK_PRODUCTS_SELLERS foreign key (SEllersID) references SELLERS (EMPLOYEEID),
CONSTRAINT FK_PRODUCTS_DEENTID foreign key (DEPARTMENTID) references DEPARTMENTS (DEPARTMENTID),
CONSTRAINT PK_PRODUCTS_PRODUCTID PRIMARY KEY (PRODUCTID)
);

CREATE TABLE TRANSPORTCOMPANIES( 
SHIPMENTID int NOT NULL, 
MODEOFTRANSPORT nvarchar,
COST int,
DESTINATION nvarchar,
CONSTRAINT PK_TRANSPORTNIES_SHIPMENTID PRIMARY KEY(SHIPMENTID)
);
CREATE TABLE STOWAR( 
WAREHOUSEID NUMERIC(18,0) NOT NULL, 
STOREID NUMERIC(18,0) NOT NULL, 
CONSTRAINT FK_STOWAR_WAREHOUSEID FOREIGN KEY (WAREHOUSEID) REFERENCES WAREHOUSES (WAREHOUSEID),
CONSTRAINT FK_STOWAR_STOREID FOREIGN KEY (STOREID) REFERENCES STORES (STOREID),
CONSTRAINT PK_STOWAR_STOREID PRIMARY KEY (WAREHOUSEID,STOREID)
);


CREATE TABLE PROWAR( 
WAREHOUSEID numeric(18,0) NOT NULL, 
PRODUCTID numeric(18,0) NOT NULL, 
CONSTRAINT FK_PROWAR_WAREHOUSEID FOREIGN KEY (WAREHOUSEID) REFERENCES WAREHOUSES(WAREHOUSEID),
CONSTRAINT FK_PROWAR_PRODUCTID FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS(PRODUCTID),
CONSTRAINT PK_PROWAR_ID PRIMARY KEY (WAREHOUSEID,PRODUCTID)
);



CREATE TABLE DEPPHY( 
CUSTOMERID INT NOT NULL, 
DEPARTMENTID NUMERIC(18,0) NOT NULL, 
CONSTRAINT PK_DEPPHY_DEPARTMENTID FOREIGN KEY (DEPARTMENTID) REFERENCES DEPARTMENTS(DEPARTMENTID),
CONSTRAINT PK_DEPPHY_CUSTOMERID FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID),
CONSTRAINT PK_DEPPHY_ID PRIMARY KEY (CUSTOMERID,DEPARTMENTID)
);



CREATE TABLE DEPDEP( 
DEPARTMENTID NUMERIC(18,0) NOT NULL,
EMPLOYEEID NUMERIC(18,0) NOT NULL,
CONSTRAINT FK_DEPDEP_SELLERS FOREIGN KEY (EMPLOYEEID) REFERENCES SELLERS(EMPLOYEEID), 
CONSTRAINT FK_DEPDEP_DEPARTMENTID FOREIGN KEY (DEPARTMENTID) REFERENCES DEPARTMENTS(DEPARTMENTID),
CONSTRAINT PK_DEPDEP_ID PRIMARY KEY (DEPARTMENTID,EMPLOYEEID)
);




CREATE TABLE SALES( 
CUSTOMERID INT NOT NULL, 
PRODUCTID NUMERIC(18,0) NOT NULL, 
STOREID NUMERIC(18,0) NOT NULL, 
CONSTRAINT FK_SALES_STOREID FOREIGN KEY (STOREID) REFERENCES STORES(STOREID),
CONSTRAINT FK_SALES_CUSTOMERID FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID),
CONSTRAINT FK_SALES_PRODUCTID FOREIGN KEY(PRODUCTID) REFERENCES PRODUCTS(PRODUCTID),
CONSTRAINT PK_SALES_ID PRIMARY KEY (STOREID,CUSTOMERID,PRODUCTID)
);

CREATE TABLE SHOWCASES( 
STOREID numeric(18,0) NOT NULL, 
EMPLOYEEID numeric(18,0) NOT NULL,
SEASON nvarchar(20),
WEATEHR nvarchar(20),
CONSTRAINT FK_SHOWCASES_SELLERS foreign key (EMPLOYEEID) references SELLERS (EMPLOYEEID),
CONSTRAINT FK_SHOWCASES_STOREID foreign key (STOREID) references STORES (STOREID),
CONSTRAINT PK_SHOWCASES_STOREID PRIMARY KEY(STOREID,EMPLOYEEID)
);
CREATE TABLE ADVISORS ( 
EMPLOYEEID numeric(18,0) not null,
ADVISORSID numeric(18,0) NOT NULL, 
SEARCHNUMBER numeric(18,0) NOT NULL,
DEPARTMENTID numeric(18,0) NOT NULL,
CONSTRAINT FK_ADVISORS_EMPLOYEESID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID), 	
CONSTRAINT FK_ADVISORS_DEPARTMENTID foreign key (DEPARTMENTID) references DEPARTMENTS(DEPARTMENTID),
CONSTRAINT PK_ADVISORS_EMPLOYEEID PRIMARY KEY(EMPLOYEEID)
) ;
CREATE TABLE SECURITYGUARDS ( 
EMPLOYEEID numeric(18,0) not null,
STOREID numeric (18,0) not null,
SECURITYGUARDID numeric(18,0) NOT NULL, 
LICENSE numeric(20) NOT NULL,
WALKYTALKY numeric (20) NOT NULL,
CONSTRAINT UQ_SECURITYGUARDS_WALKYTALKY unique (WALKYTALKY),
CONSTRAINT FK_SECURITYGUARDS_EMPLOYEEID foreign key (EMPLOYEEID) references EMPLOYEES(EMPLOYEEID),
CONSTRAINT FK_SECURITYGUARDS_STOREID foreign key (STOREID) references STORES(STOREID),
CONSTRAINT PK_SECURITYGUARDS_EMPLOYEEID PRIMARY KEY (EMPLOYEEID)
) ;
CREATE TABLE CYBERSEMAILS(
CUSTOMERID INT not null, 
EMAIL nvarchar(50),
CONSTRAINT FK_CYBERS_CYBERID foreign key (CUSTOMERID) references CYBERS (CUSTOMERID),
CONSTRAINT PK_CYBERSEMAIL_CYB_EMAIL PRIMARY KEY (CUSTOMERID,EMAIL)
);