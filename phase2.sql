DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS servicerequest;
DROP TABLE IF EXISTS mechanic CASCADE;
DROP TABLE IF EXISTS owns;
DROP TABLE IF EXISTS checks;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS creates;

CREATE TABLE Cars (VIN INTEGER NOT NULL,
                   make CHAR(20) NOT NULL,
                   model CHAR(20) NOT NULL,
                   year INTEGER NOT NULL,
                   PRIMARY KEY(VIN)
);
CREATE TABLE Mechanic (VIN INTEGER NOT NULL,
		       years_of_exp INTEGER NOT NULL,
                       employee_id INTEGER NOT NULL,
                       first_name CHAR(20) NOT NULL,
                       last_name CHAR(20) NOT NULL,
                       PRIMARY KEY(employee_id),
                       FOREIGN KEY (VIN) REFERENCES Cars
);
CREATE TABLE works_on (VIN INTEGER NOT NULL,
                       employee_id INTEGER NOT NULL,
                       PRIMARY KEY(employee_id),
                       FOREIGN KEY (VIN) REFERENCES Cars,
                       FOREIGN KEY (employee_id) REFERENCES Mechanic
);
CREATE TABLE Customer (first_name CHAR(20) NOT NULL,
		       last_name CHAR(20) NOT NULL,
		       phone_number CHAR(12) NOT NULL,
		       address CHAR(30) NOT NULL
);
CREATE TABLE owns (VIN INTEGER NOT NULL,
                   PRIMARY KEY(VIN),
                   FOREIGN KEY (VIN) REFERENCES Cars
);
CREATE TABLE ServiceRequest (problems CHAR(30) NOT NULL,
			     bill CHAR(20) NOT NULL,
			     odometer_reading CHAR(20) NOT NULL,
			     comments CHAR(30) NOT NULL,
			     status CHAR(20) NOT NULL,
			     open_date DATE NOT NULL,
			     close_date DATE NOT NULL,
			     employee_id INTEGER NOT NULL,
			     FOREIGN KEY (employee_id) REFERENCES Mechanic ON DELETE NO ACTION
);
CREATE TABLE checks (VIN INTEGER NOT NULL,
                     PRIMARY KEY(VIN),
                     FOREIGN KEY (VIN) REFERENCES Cars
);
CREATE TABLE creates (employee_id INTEGER NOT NULL,
                      FOREIGN KEY (employee_id) REFERENCES Mechanic ON DELETE NO ACTION
);
