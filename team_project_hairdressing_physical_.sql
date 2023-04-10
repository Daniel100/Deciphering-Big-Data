-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-02-18 13:23:00.39

-- tables
-- Table: country_code_glossary
CREATE TABLE country_code_glossary (
    country_code STRING NOT NULL,
    country STRING NOT NULL
);

-- Table: dim_customer
CREATE TABLE dim_customer (
    id INT64 NOT NULL,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    email_address STRING NOT NULL,
    phone_country_code STRING NOT NULL,
    phone_number STRING NOT NULL
);

-- Table: dim_employee
CREATE TABLE dim_employee (
    id INT64 NOT NULL,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    date_of_birth DATE NOT NULL,
    date_joined DATE NOT NULL,
    date_left INT64,
    email_address STRING NOT NULL,
    phone STRING NOT NULL,
    annual_salary NUMERIC NOT NULL
);

-- Table: dim_payment
CREATE TABLE dim_payment (
    id INT64 NOT NULL,
    product_id INT64 NOT NULL,
    amount_paid NUMERIC NOT NULL,
    original_amount NUMERIC NOT NULL,
    is_discounted BOOL NOT NULL,
    payment_type STRING NOT NULL,
    discount_rate INT64 NOT NULL,
    customer_satisfaction INT64 NOT NULL,
    tax_rate INT64 NOT NULL,
    net_amount_after_tax INT64 NOT NULL,
    dim_service_id INT64 NOT NULL
);

-- Table: dim_service
CREATE TABLE dim_service (
    id INT64 NOT NULL,
    description STRING NOT NULL,
    price NUMERIC NOT NULL,
    category STRING NOT NULL,
    tax_rate INT64 NOT NULL
);

-- Table: employee_monthly_performance_report
CREATE TABLE employee_monthly_performance_report (
    primary_key INT64 NOT NULL,
    date_generated DATE NOT NULL,
    employee_id INT64 NOT NULL,
    total_sales NUMERIC NOT NULL,
    avg_satisfaction_score NUMERIC NOT NULL,
    total_clients_served INT64 NOT NULL
);

-- Table: fct_transactions
CREATE TABLE fct_transactions (
    id INT64 NOT NULL,
    customer_id INT64 NOT NULL,
    employee_id INT64 NOT NULL,
    payment_id INT64 NOT NULL,
    visit_date DATE NOT NULL,
    service_id INT64 NOT NULL,
    customer_satisfaction_score INT64,
    net_amount INT64 NOT NULL,
    gross_amount INT64 NOT NULL,
    dim_customer_id INT64 NOT NULL,
    dim_employee_id INT64 NOT NULL,
    dim_payment_id INT64 NOT NULL
);

-- Table: fct_transactions_employee_monthly_performance_report
CREATE TABLE fct_transactions_employee_monthly_performance_report (
    fct_transactions_id INT64 NOT NULL,
    employee_monthly_performance_report_primary_key INT64 NOT NULL
);

-- Table: fct_transactions_sales_report
CREATE TABLE fct_transactions_sales_report (
    fct_transactions_id INT64 NOT NULL,
    sales_report_primary_key INT64 NOT NULL
);

-- Table: sales_report
CREATE TABLE sales_report (
    date DATE NOT NULL,
    gross_sales NUMERIC NOT NULL,
    net_sales NUMERIC NOT NULL,
    most_sold_service INT64 NOT NULL,
    primary_key INT64 NOT NULL
);

-- foreign keys
-- Reference: dim_customer_country_code_glossary (table: dim_customer)


-- Reference: dim_payment_dim_product (table: dim_payment)


-- Reference: fct_transactions_dim_customer (table: fct_transactions)


-- Reference: fct_transactions_dim_payment (table: fct_transactions)


-- Reference: fct_transactions_employee_id (table: fct_transactions)


-- Reference: fct_transactions_employee_monthly_performance_report_employee_monthly_performance_report (table: fct_transactions_employee_monthly_performance_report)


-- Reference: fct_transactions_employee_monthly_performance_report_fct_transactions (table: fct_transactions_employee_monthly_performance_report)


-- Reference: fct_transactions_sales_report_fct_transactions (table: fct_transactions_sales_report)


-- Reference: fct_transactions_sales_report_sales_report (table: fct_transactions_sales_report)


-- End of file.

