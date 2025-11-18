/* first example */
select 
	Academicians_table.Academicians_full_name, 
	len(Academicians_table.Academicians_full_name) 
		as Number_of_characters 
	from Academicians_table;
go

/* second example */
select
	trim(Academicians_table.Academicians_full_name) 
		as Full_name, Academicians_table.Academicians_date_of_birth, 
		Academicians_table.Academicians_specialization, 
		Academicians_table.Academicians_year_of_awarding_the_title 
	from Academicians_table;
go

/* third example */
select 
	Academicians_table.Academicians_full_name, 
	charindex('о', Academicians_table.Academicians_full_name) 
		as Position 
	from Academicians_table;
go

/* fourth example */
select 
	Academicians_table.Academicians_full_name, 
	left(Academicians_table.Academicians_specialization, 3) 
		as Specialization_3 
	from Academicians_table;
go

/* fifth example */
select 
	Academicians_table.Academicians_full_name, 
	substring(Academicians_table.Academicians_specialization, 2, 4) 
		as Specialization_2_5 
	from Academicians_table;
go

/* sixth example */
select 
	Academicians_table.Academicians_full_name, 
	Academicians_table.Academicians_date_of_birth, 
	replace(Academicians_table.Academicians_specialization, 'Ћингвист', 'языковед') 
		as Specialization, 
		Academicians_table.Academicians_year_of_awarding_the_title 
	from Academicians_table;
go

/* seventh example */
select 
	Academicians_table.Academicians_full_name, 
	Academicians_table.Academicians_date_of_birth, 
	upper(Academicians_table.Academicians_specialization) 
		as Specialization, 
		Academicians_table.Academicians_year_of_awarding_the_title 
	from Academicians_table;
go

/* eighth example */
select 
	Academicians_table.Academicians_full_name, 
	reverse(Academicians_table.Academicians_full_name) 
		as Reversed_full_name 
	from Academicians_table;
go

/* ninth example */
select distinct 
	replicate(Academicians_table.Academicians_specialization, 4) 
		as Specializations 
	from Academicians_table;
go

/* tenth example */
select
	abs(cos(pi())) 
		as Cos_PI,
	abs(sin(pi())) 
		as Sin_PI,
	abs(tan(pi())) 
		as Tan_PI,
	abs(cot(pi())) 
		as Cot_PI;
go

/* eleventh example */
select
	round(123.456, 3) 
		as Round3,
	round(123.456, 2) 
		as Round2,
	round(123.456, 1) 
		as Round1,
	round(123.456, 0) 
		as Round0,
	round(123.456, -1) 
		as Round_1,
	round(123.456, -2) 
		as Round_2,
	round(123.456, -3) 
		as Round3;
go

/* twelfth example */
select 
	ceiling(123.456) 
		as More,
	floor(123.456) 
		as Less;
go

/* thirteenth example */
select
	sqrt(25) 
		as Square_root,
	square(25) 
		as Square_power,
	power(25, 3) 
		as Cube_puwer;
go

/* fourteenth example */
select getdate() 
	as Now_time

/* fifteenth example */
select 
	day(getdate()) 
		as Day_time, 
	month(getdate()) 
		as Month_time, 
	year(getdate()) 
		as Year_time,
	datepart(hour, getdate()) 
		as Hour_time,
	datepart(minute, getdate()) 
		as Minute_time,
	datepart(second, getdate()) 
		as Second_time,
	datepart(quarter, getdate()) 
		as Quarter_time,
	datepart(week, getdate()) 
		as Week_time,
	datepart(dayofyear, getdate()) 
		as Day_of_year_time,
	datepart(weekday, getdate()) 
		as Week_day_time;
go

/* sixteenth example */
select 
	dateadd(day, -100, getdate()) 
		as One_hundred_days_ago;
go

/* seventeenth example */
select 
	datediff(day, '18950708', '19710412') 
		as Number_of_lived_days;
go

/* eighteenth example */
select 
	Academicians_table.Academicians_full_name, 
		case MONTH(Academicians_table.Academicians_date_of_birth) 
			when 3 
				then 'Spring' 
			when 4 
				then 'Spring' 
			when 5 
				then 'Spring' 
			when 6 
				then 'Summer' 
			when 7 
				then 'Summer' 
			when 8 
				then 'Summer' 
			when 9 
				then 'Autumn' 
			when 10 
				then 'Autumn' 
			when 11 
				then 'Autumn' 
			else 'Winter' 
			end 
				as Season 
	from Academicians_table;
go

/* nineteenth example */
select
	Academicians_table.Academicians_full_name,
	Academicians_table.Academicians_date_of_birth,
	case
	when (month(Academicians_table.Academicians_date_of_birth) = 3 
		and day(Academicians_table.Academicians_date_of_birth) >= 21) 
		or (month(Academicians_table.Academicians_date_of_birth) = 4 
		and day(Academicians_table.Academicians_date_of_birth) <= 20) 
			then 'Aries'
	when (month(Academicians_table.Academicians_date_of_birth) = 4 
		and day(Academicians_table.Academicians_date_of_birth) >= 21) 
		or (month(Academicians_table.Academicians_date_of_birth) = 5 
		and day(Academicians_table.Academicians_date_of_birth) <= 21) 
			then 'Taurus'
	when (month(Academicians_table.Academicians_date_of_birth) = 5 
		and day(Academicians_table.Academicians_date_of_birth) >= 22) 
		or (month(Academicians_table.Academicians_date_of_birth) = 6 
		and day(Academicians_table.Academicians_date_of_birth) <= 21) 
			then 'Gemini'
	when (month(Academicians_table.Academicians_date_of_birth) = 6 
		and day(Academicians_table.Academicians_date_of_birth) >= 22) 
		or (month(Academicians_table.Academicians_date_of_birth) = 7 
		and day(Academicians_table.Academicians_date_of_birth) <= 22) 
			then 'Cancer'
	when (month(Academicians_table.Academicians_date_of_birth) = 7 
		and day(Academicians_table.Academicians_date_of_birth) >= 23) 
		or (month(Academicians_table.Academicians_date_of_birth) = 8 
		and day(Academicians_table.Academicians_date_of_birth) <= 21) 
			then 'Leo'
	when (month(Academicians_table.Academicians_date_of_birth) = 8 
		and day(Academicians_table.Academicians_date_of_birth) >= 22) 
		or (month(Academicians_table.Academicians_date_of_birth) = 9 
		and day(Academicians_table.Academicians_date_of_birth) <= 23) 
			then 'Virgo'
	when (month(Academicians_table.Academicians_date_of_birth) = 9 
		and day(Academicians_table.Academicians_date_of_birth) >= 24) 
		or (month(Academicians_table.Academicians_date_of_birth) = 10 
		and day(Academicians_table.Academicians_date_of_birth) <= 23) 
			then 'Libra'
	when (month(Academicians_table.Academicians_date_of_birth) = 10 
		and day(Academicians_table.Academicians_date_of_birth) >= 24) 
		or (month(Academicians_table.Academicians_date_of_birth) = 11 
		and day(Academicians_table.Academicians_date_of_birth) <= 22) 
			then 'Scorpio'
	when (month(Academicians_table.Academicians_date_of_birth) = 11 
		and day(Academicians_table.Academicians_date_of_birth) >= 23) 
		or (month(Academicians_table.Academicians_date_of_birth) = 12 
		and day(Academicians_table.Academicians_date_of_birth) <= 22) 
			then 'Sagittarius'
	when (month(Academicians_table.Academicians_date_of_birth) = 12 
		and day(Academicians_table.Academicians_date_of_birth) >= 23) 
		or (month(Academicians_table.Academicians_date_of_birth) = 1 
		and day(Academicians_table.Academicians_date_of_birth) <= 20) 
			then 'Capricorn'
	when (month(Academicians_table.Academicians_date_of_birth) = 1 
		and day(Academicians_table.Academicians_date_of_birth) >= 21) 
		or (month(Academicians_table.Academicians_date_of_birth) = 2 
		and day(Academicians_table.Academicians_date_of_birth) <= 19)
			then 'Aquarius'
	when (month(Academicians_table.Academicians_date_of_birth) = 2 
		and day(Academicians_table.Academicians_date_of_birth) >= 20) 
		or (month(Academicians_table.Academicians_date_of_birth) = 3 
		and day(Academicians_table.Academicians_date_of_birth) <= 20) 
			then 'Pisces'
	end as Zodiac_sign
from Academicians_table

/* twentieth example */
select 
	Academicians_table.Academicians_full_name,
	Academicians_table.Academicians_date_of_birth,
	Academicians_table.Academicians_specialization,
	Academicians_table.Academicians_year_of_awarding_the_title,
	iif(Academicians_table.Academicians_year_of_awarding_the_title - year(Academicians_table.Academicians_date_of_birth) <= 45, 'Young','Old') 
		as Age_at_awarding
	from Academicians_table


