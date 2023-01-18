CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);
ALTER TABLE customer
DROP COLUMN car_id;
CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    car_make VARCHAR(45),
    car_model VARCHAR(45),
    car_year VARCHAR(45)
);

CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
ALTER TABLE salesperson
DROP COLUMN customer_id;

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    salesperson_id INTEGER,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_(
    service_ticket SERIAL PRIMARY KEY,
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE service_history(
    service_history_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    service_ticket INTEGER,
    FOREIGN KEY (service_ticket) REFERENCES service_(service_ticket)
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
);

CREATE OR REPLACE FUNCTION add_customer (
    customer_id INTEGER,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$MAIN$
BEGIN
    INSERT INTO customer(customer_id, first_name, last_name)
    VALUES (customer_id,first_name,last_name);
END
$MAIN$
;
SELECT add_customer(1, 'B', 'R');
SELECT add_customer(2, 'R', 'B');
SELECT * FROM customer

CREATE OR REPLACE FUNCTION add_car (
    car_id INTEGER,
    car_make VARCHAR(45),
    car_model VARCHAR(45),
    car_year VARCHAR(45)
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$MAIN$
BEGIN
    INSERT INTO car(car_id, car_make, car_model, car_year)
    VALUES (car_id, car_make, car_model, car_year);
END
$MAIN$
;
SELECT add_car(1, 'Honda', 'Accord', '2016');
SELECT add_car(2, 'Honda', 'Civic', '2022');
SELECT * FROM car

CREATE OR REPLACE FUNCTION add_salesperson (
    salesperson_id INTEGER,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$MAIN$
BEGIN
    INSERT INTO salesperson(salesperson_id, first_name, last_name)
    VALUES (salesperson_id, first_name, last_name);
END
$MAIN$
;
SELECT add_salesperson(1, 'C', 'A');
SELECT add_salesperson(2, 'A', 'C');
SELECT * FROM salesperson

CREATE OR REPLACE FUNCTION add_invoice (
    invoice_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$MAIN$
BEGIN
    INSERT INTO invoice(invoice_id)
    VALUES (invoice_id);
END
$MAIN$
;
SELECT add_invoice(1);
SELECT add_invoice(2, );

SELECT *
FROM invoice

SELECT *
FROM mechanic

