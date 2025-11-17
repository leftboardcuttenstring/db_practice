alter table Statements
add constraint fk_statements_specialties
	foreign key (Statement_specialty_code)
	references Specialties(Specialty_code)

alter table Statements
add constraint fk_statements_applicants
	foreign key (Statement_applicant_code)
	references Applicants(Applicant_code)

alter table Assessments
add constraint fk_assessments_applicants
	foreign key (Assessment_applicant_code)
	references Applicants(Applicant_code)

alter table Assessments
add constraint fk_assessments_exams
	foreign key (Assessment_exam_code)
	references Exams(Exam_code)

alter table Exams
add constraint fk_exams_disciplines
	foreign key (Exam_discipline_code)
	references Disciplines(Discipline_code)

alter table Exams
add constraint fk_exams_specialties
	foreign key (Exam_specialty_code)
	references Specialties(Specialty_code)