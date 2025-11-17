# db_practice
Due to the different encoding in Windows, I can't write comments in Russian directly in the code (this can be seen in one of the early commits, dated October 22, 2025).
When writing the query code, I used Microsoft's SQL Server Management Studio (21.5.14), so to guarantee proper operation, it's best to use it on your PC (I just don't know how or where else I can do all this properly).
If you encounter any errors, please email michael.a.strangewood@gmail.com. I'll try to fix the problem with the code (if it's not working).

To avoid being confused by the red underlines, you can click the "Edit" menu - "IntelliSense" - "Refresh local cache".  

Building:
1. To complete each subsequent laboratory work, the result of the previous one is required
2. Execute all SQL queries in ascending order of the number at the beginning of the query name (from 1 to the last)
3. If you don't see the SQL query number, please refer to the README file for build instructions.

## Building laboratory_work7
If you want to run the queries in Lab 7, you need to carefully look at the query code: there's a 'first_query.sql' query and a 'second_query.sql' query. There, one block of SQL code corresponds to another—read the PDF of Lab 7's manual at moodle-new.chemk.org and you'll understand what I'm talking about (see next paragraph for more detailed explanation).
Two query files are executed like this: first the first, then the second, without waiting for the first query to complete.
The files contain several blocks of code, each with its own NOTES explanation. The first block in 'first_query.sql' corresponds to the first block in 'second_query.sql', and they should be executed as follows: 1-1, 2-2, 3-3. That is, first execute the first blocks in the queries, then comment them out; then uncomment the second blocks of the queries, execute them, and comment them out; the same with the third and fourth blocks.  
  
**Translated:** Если вы хотите выполнить запросы в лабораторной работе 7, внимательно изучите код запроса: есть запрос «first_query.sql» и запрос «second_query.sql». Там один блок SQL-кода соответствует другому — прочтите PDF-файл руководства по лабораторной работе 7 на сайте moodle-new.chemk.org, и вы поймёте, о чём я говорю (см. следующий абзац для более подробного объяснения).
Два файла с запросами выполняются так - сначала первый, а потом второй, причем не нужно дожидаться окончания выполнения первого запроса.
В файлах есть несколько блоков кода, к которым привязаны свои пояснения NOTES. Так вот, первый блок в 'first_query.sql' соответствует первому блоку в 'second_query.sql', и выполнять их нужно так: 1-1, 2-2, 3-3. То есть, сначала выполняете первые блоки в запросах, потом комментируете эти блоки; затем раскомментируете вторые блоки запросов, выполняете, закомментируете их; также с третьими блоками и четвертыми.
Я решил написать комментарий на русском языке, т.к. тут слов много и понятнее будет на нем

## Building laborator_work17(rough)
So far, a rough solution to this lab work has been presented - I did everything manually, which by default should have been done through a graphical interface
  
**Translated:** Пока представлена грубая форма решения этой лабраторной работы - я делал вручную то, что по умолчанию должно было делаться через графический интерфейс SSMS
