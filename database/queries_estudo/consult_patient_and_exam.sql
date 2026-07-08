-- Query: Consult patient and exams ordered via LIS logs
SELECT 
    p.patient_name AS "patient",
    p.age,
    p.gender,
    e.exam_code AS "mnemonic",
    e.exam_name
FROM fact_lab_orders o
INNER JOIN dim_patients p ON o.patient_id = p.patient_id
INNER JOIN dim_exams e ON o.exam_id = e.exam_id
--WHERE p.patient_name = 'John Doe' -- Search by patient
--AND e.exam_code = 'HEM01' -- Search by exam
