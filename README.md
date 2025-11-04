# db_practice
Due to the different encoding in Windows, I can't write comments in Russian directly in the code (this can be seen in one of the early commits, dated October 22, 2025).
When writing the query code, I used Microsoft's SQL Server Management Studio (21.5.14), so to guarantee proper operation, it's best to use it on your PC (I just don't know how or where else I can do all this properly).
If you encounter any errors, please email michael.a.strangewood@gmail.com. I'll try to fix the problem with the code (if it's not working).

## Building laboratory_work1
This happens in the following order:
1. Run **creating_the_tables.sql**
2. Run **add_constraints.sql**
3. Run **add_relationships.sql**
4. Run **insert_data.sql**

## Building laboratory_work2
This happens in the following order:
1. You need to have the exact **result of running laboratory_work1**
2. Run **insert_data.sql**
3. Run **create_the_views.sql**

## Building laboratory_work3
This happens in the following order:
1. You need to have the exact **result of running laboratory_work2**
2. Run **creating_the_procedures.sql**

## Building laboratory_work4
This happens in the following order:
1. You need to have the exact **result of running laboratory_work3**
2. Run **creating_the_triggers.sql**

## Building laboratory_work5
This happens in the following order:
1. You need to have the exact **result of running laboratory_work4**
2. Run **creating_the_functions.sql**

## Building laboratory_work6
This happens in the following order:
1. You need to have the exact **result of running laboratory_work5**
2. Run **creating_the_functions.sql**

## Building laboratory_work7
🇺🇸: If you want to run the queries in Lab 7, you need to carefully look at the query code: there's a 'first_query.sql' query and a 'second_query.sql' query. There, one block of SQL code corresponds to another—read the PDF of Lab 7's manual at moodle-new.chemk.org and you'll understand what I'm talking about (see next paragraph for more detailed explanation).
Two query files are executed like this: first the first, then the second, without waiting for the first query to complete.
The files contain several blocks of code, each with its own NOTES explanation. The first block in 'first_query.sql' corresponds to the first block in 'second_query.sql', and they should be executed as follows: 1-1, 2-2, 3-3. That is, first execute the first blocks in the queries, then comment them out; then uncomment the second blocks of the queries, execute them, and comment them out; the same with the third and fourth blocks.

🇷🇺 Если вы хотите выполнить запросы в лабораторной работе 7, внимательно изучите код запроса: есть запрос «first_query.sql» и запрос «second_query.sql». Там один блок SQL-кода соответствует другому — прочтите PDF-файл руководства по лабораторной работе 7 на сайте moodle-new.chemk.org, и вы поймёте, о чём я говорю (см. следующий абзац для более подробного объяснения).
Два файла с запросами выполняются так - сначала первый, а потом второй, причем не нужно дожидаться окончания выполнения первого запроса.
В файлах есть несколько блоков кода, к которым привязаны свои пояснения NOTES. Так вот, первый блок в 'first_query.sql' соответствует первому блоку в 'second_query.sql', и выполнять их нужно так: 1-1, 2-2, 3-3. То есть, сначала выполняете первые блоки в запросах, потом комментируете эти блоки; затем раскомментируете вторые блоки запросов, выполняете, закомментируете их; также с третьими блоками и четвертыми.
Я решил написать комментарий на русском языке, т.к. тут слов много и понятнее будет на нем
