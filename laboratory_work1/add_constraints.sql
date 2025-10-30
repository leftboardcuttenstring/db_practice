alter table Applicants
add constraint ch_applicants_status
	check(Status in ('Enrolled', 'Not enrolled', 'Collected documents'))

alter table Disciplines
add constraint uk_disciplines_name unique(Name)

alter table Statements
add constraint ch_statements_status
	check(Status in ('Enrolled', 'Not enrolled', 'Collected documents'))

alter table Exams
add constraint uk_exams_discipline_and_speciality_codes unique(Discipline_code, Speciality_code)

alter table Specialties
add constraint uk_specialities_name unique(Name)

alter table Assessments
add constraint uk_assessments_assessments unique(Applicant_code, Exam_code)

alter table Exams
add constraint ch_exams_positive_score check(Positive_score between 0 and 100)