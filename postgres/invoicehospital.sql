BEGIN TRANSACTION;     
        
CREATE TABLE customer
(
        customer_id serial, 
        last_name varchar (64) NOT NULL,
        first_name varchar (64) NOT NULL,
        street_address varchar (100) NOT NULL,
        city varchar (64) NOT NULL,
        district varchar (64) NOT NULL, 
        postal_code varchar (10) NOT NULL,     
        
        CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

CREATE TABLE pet_type
(
        type_id serial,
        pet_type varchar (64) NOT NULL,
        
        CONSTRAINT pk_type_id PRIMARY KEY (type_id)
        
); 

CREATE TABLE invoice
(  
        invoice_id serial,
        invoice_date date NOT NULL,
        hospital_name varchar (100), 
        customer_id int NOT NULL,
        
        
        CONSTRAINT pk_invoice_id PRIMARY KEY (invoice_id),
        CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
        
);


CREATE TABLE pet
(
        pet_id serial, 
        pet_name varchar (64) NOT NULL,
        pet_age int NOT NULL,
        owner_id int NOT NULL,
        type_id int NOT NULL,
        
        
        CONSTRAINT pk_pet_id PRIMARY KEY (pet_id),
        CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES customer (customer_id),
        CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES pet_type (type_id)
        
);


CREATE TABLE hospital_procedure
(
        procedure_id serial,
        procedure_type varchar (100) NOT NULL,
        
        CONSTRAINT pk_procedure_id PRIMARY KEY (procedure_id)
             
); 
 

CREATE TABLE pet_invoice
(

        invoice_id int NOT NULL,
        pet_id int NOT NULL,
        procedure_id int NOT NULL,
        price money NOT NULL,
        
        CONSTRAINT pk_pet_invoice_invoice_id_pet_id PRIMARY KEY (invoice_id, pet_id), 
        CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoice (invoice_id),
        CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet (pet_id),
        CONSTRAINT fk_procedure_id FOREIGN KEY (procedure_id) REFERENCES hospital_procedure (procedure_id)
        
);

COMMIT;

DROP TABLE pet_invoice;
DROP TABLE pet_procedure;
DROP TABLE hospital_procedure;
DROP TABLE pet;
DROP TABLE invoice;
DROP TABLE pet_type;
DROP TABLE customer;