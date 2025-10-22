/*  here're only examples, you can cut out some piece and use it, but not 
    using everything by the same time (!!!)
*/

create table Students (
    StudentID int primary key,
    LastName nvarchar(50),
    FirstName nvarchar(50),
    BirthDate date
);

/*
DISCRIPTION:
that example tells about primary keys. primary key is a column what must
be unique for every line in the table. and also primary key for a line
can't be equal NULL


create table Students (        - keywords 'create' and 'table', then Students is table's name
    StudentID int primary key, - name of column, then that's type and then keywords 'primary key'
    LastName nvarchar(50),
    FirstName nvarchar(50),
    BirthDate date
);
*/

/* ------------------------------------------------- */
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    BirthDate DATE
);

/*
DISCRIPTION:
that example tells about defining the primary key as counter
the role plays the keyword IDENTITY(1,1) what means the value
of StudentID column will be increased with every new line in the table
by 1 at a time and starts from 1

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY, - that increasing primary key what's playing the role of primary key
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    BirthDate DATE
);
*/

/* ------------------------------------------------- */
CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(100) UNIQUE,
    FullName NVARCHAR(100)
);


/*
DISCRIPTION:
that one tells about unique alternate key - alternate key is only
a column with constraint unique

CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(100) UNIQUE,              - that stuff. Just the keyword
    FullName NVARCHAR(100)
);
*/