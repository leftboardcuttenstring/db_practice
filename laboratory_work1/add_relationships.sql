alter table Statements
add constraint fk_statements_specialties
	foreign key (Speciality_code)
	references Specialties(Speciality_code)

alter table Statements
add constraint fk_statements_applicants
	foreign key (Applicant_code)
	references Applicants(Applicant_code)

alter table Assessments
add constraint fk_assessments_applicants
	foreign key (Applicant_code)
	references Applicants(Applicant_code)

alter table Assessments
add constraint fk_assessments_exams
	foreign key (Exam_code)
	references Exams(Exam_code)

alter table Exams
add constraint fk_exams_disciplines
	foreign key (Discipline_code)
	references Disciplines(Discipline_code)

alter table Exams
add constraint fk_exams_specialties
	foreign key (Speciality_code)
	references Specialties(Speciality_code)