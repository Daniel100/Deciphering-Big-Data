-- PRODUCT DATABASE

-- 1) product_database --
CREATE DATABASE product_database;
USE product_database;

-- 2) table cluster:
CREATE TABLE product_database.cluster (
    id INT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
    cluster_name VARCHAR(255) NOT NULL UNIQUE KEY,
    PRIMARY KEY (id)
);

-- 3) table product:
CREATE TABLE product_database.product (
    id INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    cluster_id INT(3) UNSIGNED,
    product_name VARCHAR(255) NOT NULL UNIQUE KEY,
    height INT(3),
    weight INT(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cluster_id) REFERENCES product_database.cluster (id)
) AUTO_INCREMENT=1;

CREATE TABLE product_database.area (
    id INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    area_name VARCHAR(255) NOT NULL UNIQUE KEY,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;

CREATE TABLE product_database.country (
    id INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    area_id INT(3) UNSIGNED,
    country_name VARCHAR(255) NOT NULL UNIQUE KEY,
    PRIMARY KEY (id),
    FOREIGN KEY (area_id) REFERENCES product_database.area (id)
);

CREATE TABLE product_database.sales (
    id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    trans_ts timestamp NOT NULL,
    units INT(6) NOT NULL,
    country_id INT(3) UNSIGNED,
    product_id INT(3) UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES product_database.country (id),
    FOREIGN KEY (product_id) REFERENCES product_database.product (id)
)AUTO_INCREMENT=1;

-- 4 Insert values:
    -- cluster
    INSERT INTO cluster (cluster_name) VALUES ("big");
    INSERT INTO cluster (cluster_name) VALUES ("medium");
    INSERT INTO cluster (cluster_name) VALUES ("small");

    -- product
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (1, "Car Ax", 10, 100);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (1, "Car Ax2", 12, 120);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (1, "Car Ax3", 12, 120);

    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (2, "Car Bx", 10, 50);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (2, "Car Bx2", 6, 60);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (2, "Car Bx3", 6, 60);

    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (3, "Car Cx", 10, 40);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (3, "Car Cx2", 6, 30);
    INSERT INTO product (cluster_id, product_name, height, weight) VALUES (3, "Car Cx3", 6, 30);

    -- area
    INSERT INTO area (area_name) VALUE ("Africa");          -- 1
    INSERT INTO area (area_name) VALUE ("Asia");            -- 2
    INSERT INTO area (area_name) VALUE ("Australia");       -- 3
    INSERT INTO area (area_name) VALUE ("Europe");          -- 4
    INSERT INTO area (area_name) VALUE ("North America");   -- 5
    INSERT INTO area (area_name) VALUE ("South America");   -- 6

    -- country
    INSERT INTO country (area_id, country_name) VALUE (4, "Germany");
    INSERT INTO country (area_id, country_name) VALUE (4, "UK");
    INSERT INTO country (area_id, country_name) VALUE (4, "Austria");
    INSERT INTO country (area_id, country_name) VALUE (5, "USA");
    INSERT INTO country (area_id, country_name) VALUE (5, "Canada");
    INSERT INTO country (area_id, country_name) VALUE (6, "Brazil");
    INSERT INTO country (area_id, country_name) VALUE (1, "South Africa");
    INSERT INTO country (area_id, country_name) VALUE (2, "China");

    -- sales
    INSERT INTO sales (units, country_id, product_id) VALUES (10, 1, 1);
    INSERT INTO sales (units, country_id, product_id) VALUES (2, 2, 2);
    INSERT INTO sales (units, country_id, product_id) VALUES (5, 3, 3);
    INSERT INTO sales (units, country_id, product_id) VALUES (100, 4, 4);
    INSERT INTO sales (units, country_id, product_id) VALUES (4, 5, 5);
    INSERT INTO sales (units, country_id, product_id) VALUES (3, 6, 6);
    INSERT INTO sales (units, country_id, product_id) VALUES (12, 2, 7);
    INSERT INTO sales (units, country_id, product_id) VALUES (11, 1, 8);
    INSERT INTO sales (units, country_id, product_id) VALUES (12, 2, 9);
    INSERT INTO sales (units, country_id, product_id) VALUES (15, 3, 5);
    INSERT INTO sales (units, country_id, product_id) VALUES (10, 4, 1);
    INSERT INTO sales (units, country_id, product_id) VALUES (14, 5, 4);
    INSERT INTO sales (units, country_id, product_id) VALUES (13, 6, 2);
    INSERT INTO sales (units, country_id, product_id) VALUES (12, 2, 1);
    
-- 5 view:
    CREATE VIEW SALESTAB AS (
        SELECT
            s.id AS 'ID', 
            s.trans_ts AS 'TIMESTAMP',
            s.units AS 'UNITS',
            p.product_name AS 'PRODUCT',
            p.height AS 'PRODUCT HEIGHT',
            p.weight AS 'WEIGHT',
            cl.cluster_name AS 'CLUSTER',
            c.country_name AS 'COUNTRY',
            a.area_name AS 'AREA'
        FROM sales s, country c, product p, cluster cl, area a
        WHERE 
            s.country_id = c.id AND 
            s.product_id = p.id AND 
            p.cluster_id = cl.id AND
            c.area_id = a.id
    );
 
