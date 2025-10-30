alter table firstTable
add constraint relationship_firsttable_secondtable
	foreign key (secondtable_code)
	references secondTable(secondtable_code)

/*
DESCRIPTION:
Initially, you have a first table (firstTable) and
a second table (secondTable). And you want to link 
the first table to the second table by the 
secondtable_code column what have firstTable and
secondTable both

alter table firstTable
add constraint relationship_firsttable_secondtable
	foreign key (secondtable_code)
	references secondTable(secondtable_code):

	alter                                    - keyword of modificating of some table or a thing
	add constraint                           - keyword for adding a costraint to 'altering' thing
	relationship_firsttable_secondtable      - name of the costraint
	foreign key                              - mentioning the column to what you want to make the relationshup
	references secondTable(secondtable_code) - keyword (references) with mentioning the column what you want to
											   connect via the relationship
*/