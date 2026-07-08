-- ========================================================
-- 1. DROP TABLES IF THEY EXIST (FOR IDEMPOTENCY)
-- ========================================================
DROP TABLE IF EXISTS fact_lab_orders;
DROP TABLE IF EXISTS dim_patients;
DROP TABLE IF EXISTS dim_exams;

-- ========================================================
-- 2. CREATE DIMENSION TABLES
-- ========================================================
CREATE TABLE dim_patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);

CREATE TABLE dim_exams (
    exam_id SERIAL PRIMARY KEY,
    exam_code VARCHAR(10) UNIQUE NOT NULL,
    exam_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    base_cost NUMERIC(10,2) NOT NULL
);

-- ========================================================
-- 3. CREATE FACT TABLE
-- ========================================================
CREATE TABLE fact_lab_orders (
    order_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES dim_patients(patient_id),
    exam_id INT REFERENCES dim_exams(exam_id),
    order_date DATE NOT NULL,
    turnaround_hours INT NOT NULL, -- TAT (Time to release results)
    status VARCHAR(20) NOT NULL,
    lab_unit VARCHAR(50) NOT NULL
);

-- ========================================================
-- 4. INSERT MOCK DATA FOR HEALTHCARE ANALYTICS SHOWCASE
-- ========================================================
INSERT INTO dim_patients (patient_name, age, gender) VALUES 
('John Doe', 34, 'M'), ('Jane Smith', 29, 'F'), 
('Carlos Silva', 45, 'M'), ('Ana Martinez', 61, 'F'),
('David Vance', 19, 'M'), ('Elena Rostova', 52, 'F');

INSERT INTO dim_exams (exam_code, exam_name, department, base_cost) VALUES 
('HEM01', 'Hemogram', 'Hematology', 45.00), 
('CRE02', 'Creatinine', 'Biochemistry', 30.00), 
('BHCG3', 'Beta-HCG', 'Immunology', 60.00), 
('COV04', 'PCR Covid', 'Molecular Biology', 180.00),
('GLU05', 'Fasting Glucose', 'Biochemistry', 25.00);

INSERT INTO fact_lab_orders (patient_id, exam_id, order_date, turnaround_hours, status, lab_unit) VALUES 
(1, 1, '2026-07-01', 4, 'Released', 'Central Lab'),
(2, 3, '2026-07-02', 6, 'Released', 'Downtown Unit'),
(3, 4, '2026-07-02', 24, 'Released', 'Central Lab'),
(4, 2, '2026-07-03', 3, 'Released', 'Westside Clinic'),
(5, 5, '2026-07-04', 2, 'Released', 'Downtown Unit'),
(1, 2, '2026-07-06', 5, 'Pending', 'Central Lab'),
(6, 4, '2026-07-07', 12, 'Released', 'Westside Clinic');
