DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  crest VARCHAR(255)
);


CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house INT2 REFERENCES houses(id) ON DELETE CASCADE,
  age INT4
);
