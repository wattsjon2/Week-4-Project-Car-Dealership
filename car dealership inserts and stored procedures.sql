-- Inserts and stored procedures

INSERT INTO customer(
	first_name,
	last_name
)VALUES(
	'Dealer',
	'Dealer'
);


INSERT INTO customer(
	first_name,
	last_name
)VALUES(
	'George',
	'Washington'
);

INSERT INTO customer(
	first_name,
	last_name
)VALUES(
	'Ben',
	'Franklin'
);

INSERT INTO finance(
	finance_type,
	insitution_name
)VALUES(
	'Cash',
	'None'
);

INSERT INTO finance(
	finance_type,
	insitution_name
)VALUES(
	'Bank',
	'Chase Bank'
);

INSERT INTO finance(
	finance_type,
	insitution_name
)VALUES(
	'Bitcoin',
	'None'
);

INSERT INTO sales_people(
	first_name,
	last_name
)VALUES(
	'Tom',
	'Brady'
);

INSERT INTO sales_people(
	first_name,
	last_name
)VALUES(
	'Patrick',
	'Mahomes'
);

INSERT INTO mechanic(
	first_name,
	last_name
)VALUES(
	'Carl',
	'Urban'
);

INSERT INTO mechanic(
	first_name,
	last_name
)VALUES(
	'Ewan',
	'McGregor'
);

INSERT INTO car(
	make,
	model,
	year,
	miles,
	last_updated,
	condition,
	customer_id
)VALUES(
	'Ford',
	'Ranger',
	2021,
	17,
	'11/5/2021',
	'new',
	1
);

INSERT INTO car(
	make,
	model,
	year,
	miles,
	last_updated,
	condition,
	customer_id
)VALUES(
	'Lamborghini',
	'Countach',
	1988,
	1337,
	'8/2/2021',
	'owned',
	3
);

INSERT INTO car(
	make,
	model,
	year,
	miles,
	last_updated,
	condition,
	customer_id
)VALUES(
	'Ford',
	'GT',
	2019,
	1776,
	'2/10/2020',
	'owned',
	2
);

INSERT INTO car(
	make,
	model,
	year,
	miles,
	last_updated,
	condition,
	customer_id
)VALUES(
	'Toyota',
	'Prius',
	2013,
	46214,
	'9/20/2021',
	'used',
	1
);

CREATE OR REPLACE PROCEDURE newinvoice(
	total NUMERIC(12,2),
	invoice_date DATE,
	car integer,
	finance integer,
	sales integer,
	customer integer
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Add late fee to customer payment amount
	INSERT INTO invoice(
	amount,
	transaction_date,
	vin,
	finance_id,
	sales_person_id,
	customer_id
	
	)VALUES(
	total,
	invoice_date,
	car,
	finance,
	sales,
	customer
		);
	
	-- Commit the above statement inside of a transaction
	COMMIT;
	
END;
$$

CALL newinvoice(2500000.00,'8/2/2021',2,3,1,3);
CALL newinvoice(500000.00,'2/10/2020',3,2,2,2);

CREATE OR REPLACE PROCEDURE newservice(
	_amount NUMERIC(12,2),
	_service_date DATE,
	_service_type VARCHAR(100),
	_vin INTEGER,
	_customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Add late fee to customer payment amount
	INSERT INTO service(
	amount,
	service_date,
	service_type,
	vin,
	customer_id
	
	)VALUES(
	_amount,
	_service_date,
	_service_type,
	_vin,
	_customer_id
		);
	
	-- Commit the above statement inside of a transaction
	COMMIT;
	
END;
$$

CALL newservice(10000.00,'11/5/2021','oil change',2,3);
CALL newservice(2013.67,'11/5/2021','blinker fluid change',3,2);

INSERT INTO service_order(
	task_description,
	parts_used,
	service_id,
	mechanic_id
)VALUES(
	'Oil change on Lamborghini Countach. Requires engine out. 2 person, 10 hour job',
	'17.5L of Castrol SLX Professional Full Synthetic SAE 5W-30 oil',
	1,
	1
);

INSERT INTO service_order(
	task_description,
	parts_used,
	service_id,
	mechanic_id
)VALUES(
	'Oil change on Lamborghini Countach. Requires engine out. 2 person, 10 hour job',
	'17.5L of Castrol SLX Professional Full Synthetic SAE 5W-30 oil',
	1,
	2
);

INSERT INTO service_order(
	task_description,
	parts_used,
	service_id,
	mechanic_id
)VALUES(
	'Blinker fluid change on Ford GT. 1 hour job',
	'2L of Valvoline Top Notch Full Synthetic Blinker Fluid',
	2,
	2
);


