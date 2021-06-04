BEGIN TRANSACTION;
       
        
CREATE TABLE customer
(
        customer_id serial, 
        last_name varchar (64) NOT NULL,
        first_name varchar (64) NOT NULL,     
        
        CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

CREATE TABLE pet
(
        pet_id serial, 
        pet_name varchar (64) NOT NULL,
        pet_type varchar (64) NOT NULL,
        pet_age int NOT NULL,
        owner_id int NOT NULL,
        
        CONSTRAINT pk_pet_id PRIMARY KEY (pet_id),
        CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES customer (customer_id)
        
);


CREATE TABLE hospital_procedure
(
        procedure_id serial,
        procedure_type varchar (100) NOT NULL,
        
        CONSTRAINT pk_procedure_id PRIMARY KEY (procedure_id)
             
); 


CREATE TABLE pet_procedure 
(
        pet_procedure_id serial, 
        procedure_id int NOT NULL,
        pet_id int NOT NULL,
        
        CONSTRAINT pk_pet_procedure_id PRIMARY KEY (pet_procedure_id),
        CONSTRAINT fk_procedure_id FOREIGN KEY (procedure_id) REFERENCES hospital_procedure (procedure_id),
        CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet (pet_id)
);  
    
COMMIT;





       


