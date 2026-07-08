-- ========================================================
-- VIEW FOR DATA CONSOLIDATION (ETL INGESTION LAYER)
-- ========================================================
SELECT 
    o.order_id,
    p.patient_name,
    p.age,
    p.gender,
    e.exam_code,
    e.exam_name,
    e.department,
    e.base_cost AS individual_exam_cost,
    o.order_date,
    o.turnaround_hours AS tat_hours, -- Target metric for LIS SLA
    o.status,
    o.lab_unit
FROM fact_lab_orders o
INNER JOIN dim_patients p ON o.patient_id = p.patient_id
LEFT JOIN dim_exams e ON o.exam_id = e.exam_id;
