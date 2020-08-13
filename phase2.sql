DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS servicerequest;
DROP TABLE IF EXISTS mechanic CASCADE;
DROP TABLE IF EXISTS owns;
DROP TABLE IF EXISTS checks;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS creates;

CREATE TABLE Cars (VIN CHAR(17) NOT NULL,
                   make CHAR(20) NOT NULL,
                   model CHAR(20) NOT NULL,
                   year INTEGER NOT NULL,
                   PRIMARY KEY(VIN)
);
CREATE TABLE Mechanic (years_of_exp INTEGER NOT NULL,
                       employee_id INTEGER NOT NULL,
                       first_name CHAR(20) NOT NULL,
                       last_name CHAR(20) NOT NULL,
                       PRIMARY KEY(employee_id)
);
CREATE TABLE works_on (VIN CHAR(17) NOT NULL,
                       employee_id INTEGER NOT NULL,
                       PRIMARY KEY(VIN,employee_id),
                       FOREIGN KEY (VIN) REFERENCES Cars,
                       FOREIGN KEY (employee_id) REFERENCES Mechanic
);
CREATE TABLE Customer (first_name CHAR(20) NOT NULL,
		       last_name CHAR(20) NOT NULL,
		       phone_number CHAR(12) NOT NULL,
		       address CHAR(30) NOT NULL,
		       PRIMARY KEY(phone_number)
);
CREATE TABLE owns (VIN CHAR(17) NOT NULL,
		   phone_number CHAR(12) NOT NULL,
                   PRIMARY KEY(VIN,phone_number),
                   FOREIGN KEY (VIN) REFERENCES Cars,
		   FOREIGN KEY (phone_number) REFERENCES Customer
);
CREATE TABLE ServiceRequest (problems CHAR(30) NOT NULL,
			     bill FLOAT NOT NULL,
			     odometer_reading CHAR(20) NOT NULL,
			     comments CHAR(30) NOT NULL,
			     status BOOLEAN NOT NULL,
			     open_date DATE NOT NULL,
			     close_date DATE,
			     invoice INTEGER NOT NULL,
			     PRIMARY KEY (invoice)
);
CREATE TABLE checks (VIN CHAR(17) NOT NULL,
		     invoice INTEGER NOT NULL,
                     PRIMARY KEY(VIN,invoice),
                     FOREIGN KEY (VIN) REFERENCES Cars,
		     FOREIGN KEY (invoice) REFERENCES ServiceRequest
);
CREATE TABLE creates (employee_id INTEGER NOT NULL,
		      invoice INTEGER NOT NULL,
		      PRIMARY KEY (employee_id,invoice),
                      FOREIGN KEY (employee_id) REFERENCES Mechanic,
		      FOREIGN KEY (invoice) REFERENCES ServiceRequest
);
