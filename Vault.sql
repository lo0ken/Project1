create table student (
                         student_id serial primary key,
                         name varchar(50) not null,
                         group int not null
);

create table subject (
                         subject_id serial primary key,
                         subject_name varchar(50) not null
);

create table exam_mark (
                           exam_mark_id serial primary key,
                           student_id int references student(student_id),
                           subject_id int references subject(subject_id),
                           mark int,
                           constraint pk_exam_mark primary key(exam_mark_id)
);

create table exam (
                      exam_id serial primary key,
                      exam_date date,
                      exam_time time
);

create table preparation (
                             preparation_id serial primary key,
                             preparation_method varchar(20) not null,
                             preparation_efficiency int check (preparation_efficiency between 1 and 5)
);

create table prepared (
                          prepared_id serial primary key,
                          student_id int references student(student_id),
                          prepared_subject int references subject(subject_id),
                          prepared_method int references preparation(preparation_id),
                          constraint pk_prepared primary key(prepared_id)
);
