CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE finance(
	finance_id SERIAL PRIMARY KEY,
	finance_type VARCHAR(100),
	insitution_name VARCHAR(100)
);

CREATE TABLE sales_people(
	sales_person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE car(
	vin SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	year INTEGER,
	miles INTEGER,
	last_updated DATE,
	condition VARCHAR(10),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	amount NUMERIC(12,2),
	transaction_date DATE,
	vin INTEGER NOT NULL,
	finance_id INTEGER NOT NULL,
	sales_person_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(vin) REFERENCES car(vin),
	FOREIGN KEY(finance_id) REFERENCES finance(finance_id),
	FOREIGN KEY(sales_person_id) REFERENCES sales_people(sales_person_id)
);

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	amount NUMERIC(12,2),
	service_date DATE,
	service_type VARCHAR(100),
	vin INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(vin) REFERENCES car(vin)

);

CREATE TABLE service_order(
	service_order_id SERIAL PRIMARY KEY,
	task_description VARCHAR(250),
	parts_used VARCHAR(250),
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)

);
