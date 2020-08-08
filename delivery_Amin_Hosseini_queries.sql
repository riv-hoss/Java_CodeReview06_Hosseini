SELECT * FROM delivery_processes WHERE delivery_status =1;
SELECT * FROM employees WHERE f_name LIKE "%i%";
SELECT * FROM address WHERE city = "Linz";
SELECT * FROM employees WHERE office_id = 1;

SELECT * FROM parcels JOIN address 
ON parcels.sender_address_id = address.id 
WHERE address.city = "Vienna";

SELECT * FROM delivery_processes JOIN parcels 
ON delivery_processes.parcel_id = parcels.id 
WHERE received_date > "2020-05-05 12:12:12";