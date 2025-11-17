alter table Applicants
add constraint ch_applicants_status
	check(Applicant_status in ('Enrolled', 'Not enrolled', 'Collected documents'))

alter table Disciplines
add constraint uk_disciplines_name unique(Discipline_name)

alter table Statements
add constraint ch_statements_status
	check(Statement_status in ('Enrolled', 'Not enrolled', 'Collected documents'))

alter table Exams
add constraint uk_exams_discipline_and_speciality_codes unique(Exam_discipline_code, Exam_specialty_code)

alter table Specialties
add constraint uk_specialities_name unique(Specialty_name)

alter table Assessments
add constraint uk_assessments_assessments unique(Assessment_applicant_code, Assessment_exam_code)

alter table Exams
add constraint ch_exams_positive_score check(Exam_positive_score between 0 and 100)