CREATE DATABASE school
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default;
       
GRANT ALL ON DATABASE school TO postgres;

CREATE TABLE school
(
  school_id integer NOT NULL,
  school_name character(50),
  location character(2),
  CONSTRAINT school_pk PRIMARY KEY (school_id)
);

CREATE TABLE course
(
  course_id integer NOT NULL,
  course_desc character(100),
  course_code character(6),
  CONSTRAINT course_pk PRIMARY KEY (course_id)
);

CREATE TABLE degrees
(
  degree_id integer NOT NULL,
  degree character(100),
  credit_requirements integer,
  CONSTRAINT degree_pk PRIMARY KEY (degree_id)
);

CREATE TABLE degcourselink
(
  degree_id integer,
  course_id integer,
  dgrcrselink_id integer NOT NULL,
  CONSTRAINT dgrcrs_pk PRIMARY KEY (dgrcrselink_id),
  CONSTRAINT dgrcrs_uk UNIQUE (degree_id, course_id)
);

CREATE TABLE schooldegreelink
(
  school_id integer,
  link_id integer NOT NULL,
  degree_id integer,
  CONSTRAINT sch_dgr_pk PRIMARY KEY (link_id),
  CONSTRAINT sch_dgre_unique UNIQUE (school_id, degree_id)
);

INSERT INTO school(school_id, school_name, location) VALUES (1, 'cuny school of professional studies', 'ny');
INSERT INTO school(school_id, school_name, location) VALUES (2, 'long island university', 'ny');
INSERT INTO degrees(degree_id, degree, credit_requirements) VALUES (1, 'data analytics', 36);
INSERT INTO degrees(degree_id, degree, credit_requirements) VALUES (2, 'business management', 30);
INSERT INTO degrees(degree_id, degree, credit_requirements) VALUES (3, 'nursing', 120);
INSERT INTO degrees(degree_id, degree, credit_requirements) VALUES (4, 'information systems', 120);
INSERT INTO course(course_id, course_desc, course_code)VALUES (1, 'probability and statistics for data analytics', 'is606');
INSERT INTO course(course_id, course_desc, course_code)VALUES (2, 'data acquisition and management', 'is607');
INSERT INTO course(course_id, course_desc, course_code)VALUES (3, 'intro to programming', 'cs101');
INSERT INTO course(course_id, course_desc, course_code)VALUES (4, 'intro to nursing', 'bio101');
INSERT INTO course(course_id, course_desc, course_code)VALUES (5, 'business', 'bus600');
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (1, 1, 1);
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (1, 2, 2);
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (1, 3, 3);
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (1, 4, 4);
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (2, 5, 3);
INSERT INTO schooldegreelink(school_id, link_id, degree_id) VALUES (2, 6, 4);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (1, 1, 1);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (1, 2, 2);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (2, 5, 3);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (3, 4, 4);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (2, 1, 5);
INSERT INTO degcourselink(degree_id, course_id, dgrcrselink_id) VALUES (4, 3, 6);

select * from school;
select * from degrees;
select * from course;
select * from schooldegreelink;
select * from degcourselink;

--Which school offers a nursing degree
select distinct school_name, degree
FROM school join schooldegreelink ON school.school_id = schooldegreelink.school_id
	join degrees ON degrees.degree_id = schooldegreelink.degree_id
WHERE degrees.degree = 'nursing';

--What are all the courses CUNY School of Professional Studies offer?
select distinct school_name, course_desc
FROM school join schooldegreelink ON school.school_id = schooldegreelink.school_id
	join degcourselink ON degcourselink.degree_id = schooldegreelink.degree_id
	join course ON course.course_id = degcourselink.course_id
WHERE school.school_id = 1;