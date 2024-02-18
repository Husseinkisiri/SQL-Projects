---How long is the average hospital stay for patients.
use diabetic_data;
select round(avg(time_in_hospital), 2) AS avg_length_of_stay from diabetic_data;
---What is the average length of stay for each racial group?
select race, round(avg(time_in_hospital), 2) AS avg_length_of_stay from diabetic_data
group by race;

---How does the admission type impact the average length of stay?
select admission_type_id, round(avg(time_in_hospital), 2) AS avg_length_of_stay
from diabetic_data
group by admission_type_id;

---Is there a racial bias in the average number of lab procedures patients recieve?
select race, round(avg(num_lab_procedures), 2) AS avg_lab_procedures
from diabetic_data
group by race;

---What is the distribution of admission types for patients?
select admission_type_id, count(*) AS admission_type_count
from diabetic_data
group by admission_type_id;

---Do more lab procedures result in longer hospital stays on average?
select num_lab_procedures, round(avg(time_in_hospital), 2) AS avg_length_of_stay
from diabetic_data
group by num_lab_procedures;

---How efficiently is teh hospital operating in terms of discharging patients faster than the average length of stay?
select*,
		CASE WHEN time_in_hospital< (select avg(time_in_hospital) from diabetic_data)
        THEN 'Yes' ELSE 'No' END AS discharged_faster_than_average
        from diabetic_data;

---Who are the top 50 patients with the most prescribed medications, using lab procedures to break ties?
select patient_nbr, count(*) AS medication_count, sum(num_lab_procedures) AS total_lab_procedures
from diabetic_data
group by patient_nbr
order by medication_count DESC, total_lab_procedures DESC
LIMIT 50;

---Do certain admission sources lead to longer lengths of stay on average?
select admission_source_id, round(avg(time_in_hospital), 2) AS avg_length_of_stay
from diabetic_data
group by admission_source_id;

---Do specific medical specialities correlates with higher numbers of lab procedures on average?
select medical_specialty, round(avg(num_lab_procedures), 2)
from diabetic_data
group by medical_specialty;

---What is the average length of stay for different age groups?
select age, round(avg(time_in_hospital), 2) AS vag_length_of_stay
from diabetic_data
group by age
order by vag_length_of_stay DESC;
---What is the common combinations of admission types and sources?
select CONCAT(admission_type_id, '_', admission_source_id) AS admission_combination, 
count(*) AS combination_count
from diabetic_data
group by admission_combination;

---Are specific admission types associated with higher average numbers of medications?
select admission_type_id, round(avg(num_medications), 2) AS avg_medications
from diabetic_data
group by admission_type_id;

----Is there a correlation between the average time in the hospital and the average number of lab procedures for patients?
select round(avg(time_in_hospital), 2) AS avg_length_of_stay, round(avg(num_lab_procedures), 2) AS avg_lab_procedures
from diabetic_data;

---How does the hospitals operational efficiency impact patient outcomes on average?
select avg(time_in_hospital) AS avg_length_of_stay,
		avg(case when time_in_hospital < (select avg(time_in_hospital) from diabetic_data)
        then 1 else 0 end) AS efficient_discharge_ratio
        from diabetic_data;
---How many patients have been admitted to the hospital for emergency care multiple times?
select medical_specialty, count(*) AS emergency_admission
from diabetic_data
where medical_specialty = 'Emergency'
group by medical_specialty
having count(*) > 1;

---What is the average length of stay for patients with diabetes compared to those without?
select diabetesMed, round(avg(time_in_hospital), 2) AS avg_length_of_stay
from diabetic_data
group by diabetesMed;

---Are there gender-based differences in the average number of lab procedures?
select gender, round(avg(num_lab_procedures), 2) AS avg_lab_procedures
from diabetic_data
group by gender;

---How many patients have diabetes and are taking insulin?
select count(*) AS insulin_dependent_diabetics
from diabetic_data
where diabetesMed = 'Yes' AND insulin = 'Yes';

---Are there specific age groups associated with higher rates of readmission?
select age, count(*) AS readmission_count
from diabetic_data
where readmitted = 'Yes'
group by age;

---Examine the distribution of patients based on their primary diagnosis?
select diag_1, count(*) AS diagnosis_count
from diabetic_data
group by diag_1;

---What is the average age of patients with different primary diagnosis?
select diag_1, round(avg(cast(substring(age, 1, 2) AS SIGNED)), 2) AS avg_age
from diabetic_data
group by diag_1;

---Analyze the distribution of the max glucose serum levels for patients?
select max_glu_serum, count(*) AS glucose_level_count
from diabetic_data
group by max_glu_serum;

---What is the average length of stay for patients with different max glucose serum levels?
select max_glu_serum, round(avg(time_in_hospital), 2) AS length_of_stay
from diabetic_data
group by max_glu_serum;

---Investigate patterns in the average length of stay for patients who changed their diabetes medication?
select `change`, round(avg(time_in_hospital), 2) AS length_of_stay
from diabetic_data
group by `change`;

----How many patients have been readmitted within 30 days?
select count(*) AS readmitted_within_30_days
from diabetic_data
where readmitted = 'Yes' AND time_in_hospital <=30;