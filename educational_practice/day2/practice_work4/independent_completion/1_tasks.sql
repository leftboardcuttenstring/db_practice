/* first task */
select 
	*
	from Academicians_table
	order by len(Academicians_table.Academicians_full_name);
go

/* second task */
select
	replace(ltrim(rtrim(Academicians_table.Academicians_full_name)), ' ', '')
		as Full_name, Academicians_table.Academicians_date_of_birth, 
		Academicians_table.Academicians_specialization, 
		Academicians_table.Academicians_year_of_awarding_the_title 
	from Academicians_table;
go

/* third task */
select 
	Academicians_table.Academicians_full_name, 
	charindex(N'ов', Academicians_table.Academicians_full_name) 
		as Position 
	from Academicians_table;
go

/* fourth task */
select 
	Academicians_table.Academicians_full_name, 
	len(Academicians_table.Academicians_full_name) - len(right(Academicians_table.Academicians_full_name, 2))
		as Full_name_2 
	from Academicians_table;
go

/* fifth task */
select
	parsename(replace(Academicians_full_name, ' ', '.'), 3) 
    + ' ' 
	+ left(parsename(replace(Academicians_full_name, ' ', '.'), 2), 1) + '.'
	+ left(parsename(replace(Academicians_full_name, ' ', '.'), 1), 1) + '.' 
		as Result
	from Academicians_table;
go

/* sixth task */
select distinct
	Academicians_table.Academicians_specialization, 
	reverse(Academicians_table.Academicians_specialization) 
		as Reversed_specialization 
	from Academicians_table;
go

/* seventh task */
select distinct 
	replicate(N'Strangewood', year(getdate()) - 2007) 
		as List;
go

/* eighth task */
select
	round(abs((power(sin(pi() / 2.0), 2.0)) - cos((3 * pi()) / 2.0)), 2)
		as First_func;
go

/* ninth task */
select 
	datediff(day, getdate(), '20251230') 
		as Number_of_leaved_days;
go
/* tenth task */
select 
	datediff(month, '20071221', getdate()) 
		as Number_of_lived_months;
go

/* eleventh task */
select
    Academicians_table.Academicians_full_name,
    case
        when (year(Academicians_table.Academicians_date_of_birth) % 400 = 0)
          or (year(Academicians_table.Academicians_date_of_birth) % 4 = 0 
              and year(Academicians_table.Academicians_date_of_birth) % 100 <> 0)
            then N'Leap'
        else N'Not leap'
    end
        as Leap_year
    from Academicians_table;
go

/* twelfth task */
select distinct
    Academicians_table.Academicians_specialization,
    case
        when len(Academicians_table.Academicians_specialization) > 10
            then N'long'
        else N'short'
    end 
        as Description_for_specialization
    from Academicians_table;
go