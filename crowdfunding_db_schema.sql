DROP DATABASE IF EXISTS crowdfunding_db;

CREATE DATABASE crowdfunding_db;

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS campaign;

CREATE TABLE contacts (
	contact_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
);

CREATE TABLE category (
	category_id VARCHAR(5) PRIMARY KEY,
	category VARCHAR(255) NOT NULL
);

CREATE TABLE subcategory (
	subcategory_id VARCHAR(10) PRIMARY KEY,
	subcategory VARCHAR(255) NOT NULL
);

CREATE TABLE campaign (
	cf_id INT PRIMARY KEY,
	contact_id INT NOT NULL,
	company_name VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL,
	goal FLOAT NOT NULL,
	pledged FLOAT NOT NULL,
	outcome VARCHAR(255) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR(2) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launched_date date NOT NULL,
	end_date date NOT NULL,
	category_id VARCHAR(5) NOT NULL,
	subcategory_id VARCHAR(10),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

COPY contacts
FROM 'C:\Users\kalio\Documents\PythonProjects\DataBootcamp\ETL\Project_2\Crowdfunding_ETL\Resources\contacts.csv'
DELIMITER ','
CSV HEADER;

COPY category
FROM 'C:\Users\kalio\Documents\PythonProjects\DataBootcamp\ETL\Project_2\Crowdfunding_ETL\Resources\category.csv'
DELIMITER ','
CSV HEADER;

COPY subcategory
FROM 'C:\Users\kalio\Documents\PythonProjects\DataBootcamp\ETL\Project_2\Crowdfunding_ETL\Resources\subcategory.csv'
DELIMITER ','
CSV HEADER;

COPY campaign
FROM 'C:\Users\kalio\Documents\PythonProjects\DataBootcamp\ETL\Project_2\Crowdfunding_ETL\Resources\campaign.csv'
DELIMITER ','
CSV HEADER;

select * from contacts;

select * from category;

select * from subcategory;

select * from campaign;